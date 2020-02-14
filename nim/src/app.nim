import sugar, sequtils, tables, json
import ../../src/dyo

proc call() =
  window.alert("Hello")

proc input(e:Event) =
  echo e.target.value


proc app():cstring {.exportc.} =
  let list = [1,2,3]
  var count = useState(0)
  echo count

  return tdiv(newJsObject(),
    h1(newJsObject(), "Nim-dyo"),
    ul(newJsObject(), list.map(
      row => li(JsObject{"style": "color:#ff6600".cstring}, $row)
    )),
    h("button", JsObject{"onclick": proc()=call()}, "button"),
    tdiv(newJsObject(),
      h("input", JsObject{"oninput": proc(e:Event)=input(e)}, "")
    )
  )

#[
import {h, useState} from 'dyo'

export default 


var count = useState(0)

h("button", {onclick:proc()=count.set(e.target.value)}, "button")
h("p", newJsObject(), count.get)

]#