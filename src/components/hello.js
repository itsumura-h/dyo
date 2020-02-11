import {h} from 'dyo'

const call=()=>{
  alert('hello')
}

const hello=()=>{
  const list = [1,2,3]
  return h('div', {}, 
    h('h1', {}, 'Hello'),
    h('ul', {}, list.map(row=>{
      return h('li', {style: 'color: #ff6600'}, row)
    })),
    h('button', {onclick: e=>{call()}}, 'ボタン')
  )
}
export default hello
