import {render} from 'dyo'
import app from './app.js';

const target = document.querySelector('main')
render(app, target)


// import {http} from 'http'
// import {h, render} from 'dyo/server'

// import app from './app.js';

// http.createServer((req, res) => {
// 	return render(h('html', {}, h(app)), res)
// }).listen(3000)
