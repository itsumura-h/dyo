import sugar, sequtils
import ../../src/dyo

proc app():cstring {.exportc.} =
  let list = [1,2,3]
  return h("div", newJsObject(),
    h("h1", newJsObject(), "Hello"),
    h("ul", newJsObject(), list.map(
      row=> h("li", newJsObject(), $row)
    ))
  )

#[
  var count = useState(0)

  h("button", {onclick:e=>count.set(e.target.value)}, "button")
  h("p", newJsObject(), count.get)

]#