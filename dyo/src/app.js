import {h} from 'dyo'
import hello from './components/hello.js'
import welcome from './components/welcome.js'

const app=()=>{
  return <div>
    <div>{hello}</div>
    <div>{welcome}</div>
  </div>
}
export default app
