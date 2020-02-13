import jsffi, sequtils, sugar, tables
export jsffi

type State* = object
  get*:cstring
  set*:proc()

proc useState*(val:cstring):State {.importc.}=
 return State(get:val)

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