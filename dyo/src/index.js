import {render} from 'dyo'
import(/* webpackChunkName: "app" */ './app.js').then(module=>{
  const target = document.querySelector('main')
  render(module.default, target)
})



// import {http} from 'http'
// import {h, render} from 'dyo/server'

// import app from './app.js';

// http.createServer((req, res) => {
// 	return render(h('html', {}, h(app)), res)
// }).listen(3000)
