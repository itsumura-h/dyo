import {h, useState} from 'dyo'

const welcome=()=>{
  const [state, setState] = useState({
    msg: '',
    count:0
  })

  return <form>
    <input
      type="text"
      onInput={event=>setState({
        msg: event.target.value,
        count:event.target.value.length
      })}
    />
    <h1>{state.msg}</h1>
    <h1>{state.count}</h1>
  </form>
}
export default welcome
