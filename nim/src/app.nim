import sugar, sequtils, tables, times, strformat
from json import add
import ../../src/dyo

proc call() =
  window.alert("Hello")

proc input(e:Event) =
  echo e.target.value

proc updateCount(count:JsObject) =
  count.set(count.getInt()+1)


proc app():cstring {.exportc.} =
  let list = [1,2,3]
  let count = useState(0)
  let msg = useState("")
  var data = useState(newJArray())
  
  let response = useState("")

  proc getPageView() =
    let startDay = (getTime().utc + initTimeInterval(days = -7)).format("yyyyMMdd")
    let endDay = (getTime().utc + initTimeInterval(days = -1)).format("yyyyMMdd")
    let url = &"https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia.org/all-access/all-agents/Nim_(programming_language)/daily/{startDay}/{endDay}"
    ajaxGet(url, @[],
      proc(httpStatus: int, resp: cstring) =
        response.set(resp)

        var tmp = newJArray(7)
        var json = fromJson[JsonNode](resp)
        for i, row in json["items"]:
          tmp[i] = row
    )


  useEffect(
    proc()=
      getPageView()
  )
  

  return h("div", newJsObject(),
    h("h1", newJsObject(), "Nim-dyo"),
    h("ul", newJsObject(), list.map(
      row => h("li", JsObject{style: "color:#ff6600".cstring}, $row)
    )),
    h("button", JsObject{onclick: proc()=call()}, "Hello"),
    h("div", newJsObject(),
      h("input", JsObject{
        oninput: proc(e:Event)=input(e),
        placeholder: "console.log".cstring
      }, "")
    ),
    h("hr", newJsObject(), ""),
    h("div", newJsObject(),
      h("h2", newJsObject(), "useState"),
      h("button", JsObject{onclick: proc()=updateCount(count)}, "add"),
      h("p", newJsObject(), $count.getInt()),
      h("input", JsObject{oninput: proc(e:Event)=msg.set(e.target.value)}, ""),
      h("p", newJsObject(), msg.getCstr()),
    ),
    h("hr", newJsObject(), ""),
    h("div", newJsObject(),
      h("h2", newJsObject(), "useEffect"),
      h("p", JsObject{style: "width:100%".cstring}, response.getCstr()),
      h("canvas", JsObject{id: "chart".cstring}, "")
    ),
    h("script", JsObject{src: "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js".cstring}, "")
  )






#[
import {h, useState, useEffect} from 'dyo'

export default 


var count = useState(0)

h("button", {onclick:proc()=count.set(e.target.value)}, "button")
h("p", newJsObject(), count.get)

]#