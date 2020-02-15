import {h, useState} from 'dyo'

const welcome=()=>{
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
export default welcome
