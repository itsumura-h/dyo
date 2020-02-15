import sugar, sequtils, tables, json
import ../../src/dyo

proc call() =
  window.alert("Hello")

proc input(e:Event) =
  echo e.target.value

proc updateCount(count:JsObject) =
  count.set(count.val.to(int)+1)


proc app():cstring {.exportc.} =
  let list = [1,2,3]
  let count = useState(0)
  let msg = useState("")

  return tdiv(newJsObject(),
    h1(newJsObject(), "Nim-dyo"),
    ul(newJsObject(), list.map(
      row => li(JsObject{"style": "color:#ff6600".cstring}, $row)
    )),
    h("button", JsObject{"onclick": proc()=call()}, "Hello"),
    tdiv(newJsObject(),
      h("input", JsObject{
        "oninput": proc(e:Event)=input(e),
        "placeholder": "console.log".cstring
      }, "")
    ),
    h("hr", newJsObject(), ""),
    tdiv(newJsObject(),
      h("h2", newJsObject(), "useState"),
      h("button", JsObject{"onclick": proc()=updateCount(count)}, "add"),
      h("p", newJsObject(), $count.val.to(int)),
      h("input", JsObject{"oninput": proc(e:Event)=msg.set(e.target.value)}, ""),
      h("p", newJsObject(), msg.val.to(cstring)),
    )
  )






#[
import {h, useState} from 'dyo'

export default 


var count = useState(0)

h("button", {onclick:proc()=count.set(e.target.value)}, "button")
h("p", newJsObject(), count.get)

]#