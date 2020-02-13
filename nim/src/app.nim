import sugar, sequtils, tables, json
import ../../src/dyo

var count = 0

proc call() =
  echo "aaa".cstring

proc app():cstring {.exportc.} =
  let list = [1,2,3]
  return tdiv(newJsObject(),
    h1(newJsObject(), "Hello"),
    ul(newJsObject(), list.map(
      row => li(JsObject{"style": "color:#ff6600".cstring}, $row)
    )),
    h("button", JsObject{"onclick": call()}, "button"),
    h("p", newJsObject(), $count)
  )

#[
import {h} from 'dyo'

export default 


var count = useState(0)

h("button", {onclick:e=>count.set(e.target.value)}, "button")
h("p", newJsObject(), count.get)

]#