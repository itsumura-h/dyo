import sugar, sequtils, tables, json
import ../../src/dyo

var count = 0

proc call() =
  window.alert("Hello")

proc input(e:Event) =
  echo e.target.value
  count = e.target.value.len


proc app():cstring {.exportc.} =
  let list = [1,2,3]
  return tdiv(newJsObject(),
    h1(newJsObject(), "Nim-dyo"),
    ul(newJsObject(), list.map(
      row => li(JsObject{"style": "color:#ff6600".cstring}, $row)
    )),
    h("button", JsObject{"onclick": proc()=call()}, "button"),
    tdiv(newJsObject(),
      h("input", JsObject{"oninput": proc(e:Event)=input(e)}, "")
    ),
    h("p", newJsObject(), $count)
  )

#[
import {h} from 'dyo'

export default 


var count = useState(0)

h("button", {onclick:proc()=count.set(e.target.value)}, "button")
h("p", newJsObject(), count.get)

]#