import {h} from 'dyo'
import hello from './components/hello.js'
import welcome from './components/welcome.js'

const app=()=>{
  const title = 'dyo'
  return (
    <div>
      <div>{hello({title:title})}</div>
      <div>{welcome}</div>
    </div>
  )
}
export default app
