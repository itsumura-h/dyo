import React, { useState } from 'react'

const Welcome=()=>{
  const [msg, setMsg] = useState('')
  const [count, setCount] = useState(0)

  return (
    <form>
      <input
        type="text"
        onInput={event=>{
          setMsg(event.target.value)
          setCount(event.target.value.length)
        }}
      />
      <h1>{msg}</h1>
      <h1>{count}</h1>
    </form>
  )
}
export default Welcome
