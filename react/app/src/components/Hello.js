import React from 'react'

const call=()=>{
  alert('hello')
}

const Hello=(props)=>{
  const list = [1,2,3]
  return <div>
    <h1>{props.title}</h1>
    <ul>
      {list.map((row, i)=>{
        return <li key={i} style={{color: '#ff6600'}}>{row}</li>
      })}
    </ul>
    <button onClick={e=>call()}>ボタン</button>
  </div>
}
export default Hello
