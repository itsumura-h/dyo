import {h} from 'dyo'

const call=()=>{
  alert('hello')
}

const hello=(props)=>{
  const list = [1,2,3]
  return <div>
    <h1>{props.title}</h1>
    <ul>
      {list.map(row=>{
        return <li style="color: #ff6600">{row}</li>
      })}
    </ul>
    <button onClick={e=>call()}>ボタン</button>
  </div>
}
export default hello