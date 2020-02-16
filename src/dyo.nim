import jsffi, sequtils, sugar, tables
import kdom_impl
import karax / [kajax, jjson]

export jsffi, kdom_impl, kajax, jjson

var console* {.importc, nodecl.}: JsObject


proc fetchImpl(url:cstring) {.importc: "fetch".}
proc fetch*(url:string) = fetchImpl(url.cstring)

# =============================================================================

proc getInt*(this:JsObject):int =
  return this.val.to(int)

proc getFloat*(this:JsObject):float =
  return this.val.to(float)

proc getStr*(this:JsObject):string =
  return this.val.to(string)

proc getCstr*(this:JsObject):cstring =
  return this.val.to(cstring)

proc getBool*(this:JsObject):bool =
  return this.val.to(bool)


proc useStateImpl(val: int):seq[JsObject] {.importc: "useState".}
proc useState*(val:int):JsObject =
  var obj = useStateImpl(val)
  return JsObject{val: obj[0], set:obj[1]}

proc useStateImpl(val:float):seq[JsObject] {.importc: "useState".}
proc useState*(val:float):JsObject =
  var obj = useStateImpl(val)
  return JsObject{val: obj[0], set:obj[1]}

proc useStateImpl(val:string):seq[JsObject] {.importc: "useState".}
proc useState*(val:string):JsObject =
  var obj = useStateImpl(val)
  return JsObject{val: obj[0], set:obj[1]}

proc useStateImpl(val:bool):seq[JsObject] {.importc: "useState".}
proc useState*(val:bool):JsObject =
  var obj = useStateImpl(val)
  return JsObject{val: obj[0], set:obj[1]}

proc useStateImpl(val:JsonNode):seq[JsObject] {.importc: "useState".}
proc useState*(val:JsonNode):JsObject =
  var obj = useStateImpl(val)
  return JsObject{val: obj[0], set:obj[1]}


proc useEffect*(didUpdate: proc()) {.importc: "useEffect".}

# =============================================================================

proc h(typ:cstring, arg:JsObject, children:varargs[cstring]):cstring {.importc.}

template h*(typ:string, arg:JsObject, children:varargs[cstring|string|int]):cstring =
  h(typ.cstring, arg, children.map(row => row.cstring))


proc h(typ:cstring, arg:JsObject, child:cstring):cstring {.importc.}

template h*(typ:string, arg:JsObject, child:string):cstring =
  h(typ.cstring, arg, child)



# =============================================================================
template h1*(arg:JsObject, children:varargs[string]):cstring =
  h("h1".cstring, arg, children.map(row => row.cstring))

template h1*(arg:JsObject, child:string):cstring =
  h("h1".cstring, arg, child.cstring)


template tdiv*(arg:JsObject, children:varargs[string]):cstring =
  h("div".cstring, arg, children.map(row => row.cstring))

template tdiv*(arg:JsObject, children:varargs[cstring]):cstring =
  h("div".cstring, arg, children)

template tdiv*(arg:JsObject, child:string):cstring =
  h("div".cstring, arg, child.cstring)


template ul*(arg:JsObject, children:varargs[string]):cstring =
  h("ul".cstring, arg, children.map(row => row.cstring))

template ul*(arg:JsObject, children:varargs[cstring]):cstring =
  h("ul".cstring, arg, children)

template ul*(arg:JsObject, child:string):cstring =
  h("ul".cstring, arg, child.cstring)


template li*(arg:JsObject, children:varargs[string]):cstring =
  h("li".cstring, arg, children.map(row => row.cstring))

template li*(arg:JsObject, children:varargs[cstring]):cstring =
  h("li".cstring, arg, children)

template li*(arg:JsObject, child:string):cstring =
  h("li".cstring, arg, child.cstring)

# =============================================================================
