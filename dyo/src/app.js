import {h, useState, useEffect} from 'dyo'
import * as moment from 'moment';
import Chart from 'chart.js';

const app=()=>{
  const title = 'dyo'
  const list = [1,2,3]
  const [count, setCount] = useState(0)
  const [msg, setMsg] = useState('')

  const call=()=>{
    alert('Hello')
  }

  const updateCount=()=>{
    setCount(count+1)
  }

  const [response, setResponse] = useState('')
  const [chartDate, setChartData] = useState({data:[], labels:[]})
  useEffect(()=>{
    let startDate = moment().add(-7, 'days').format('YYYYMMDD')
    let endDate = moment().add(-1, 'days').format('YYYYMMDD')
    let url = `https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia.org/all-access/all-agents/Nim_(programming_language)/daily/${startDate}/${endDate}`
    fetch(url).then(response=>{
      return response.json()
    }).then(response=>{
      setResponse(JSON.stringify(response))
      let data = []
      let labels = []
      for(let row of response.items){
        data.push(row.views)
        labels.push(row.timestamp)
      }
      setChartData({data:data, labels:labels})
    })

    let ctx = document.getElementById("chart")
    new Chart(ctx, {
      type: 'line',
      data: {
        labels: chartDate.labels,
        datasets: [
          {
            label: 'views',
            data: chartDate.data,
            borderColor: "rgba(255,0,0,1)",
            backgroundColor: "rgba(0,0,0,0)"
          }
        ],
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        title: {
          display: true,
          text: 'Nim wiki views'
        }
      }
    })
  }, [response])

  return (
    <div>
      <h1>{title}</h1>
      <ul>
        {list.map(row=>{
          return <li style="color: #ff6600">{row}</li>
        })}
      </ul>
      <button onclick={call}>Hello</button>
      <div>
        <input type="text" onInput={e=>console.log(e.target.value)} />
      </div>
      <hr/>
      <div>
        <h2>useState</h2>
        <button onclick={updateCount}>add</button>
        <p>{count}</p>
        <input type="text" onInput={e=>setMsg(e.target.value)}/>
        <p>{msg}</p>
      </div>
      <hr/>
      <div>
        <h2>useEffect</h2>
        <p>{response}</p>
        <canvas id="chart"/>
      </div>
    </div>
  )
}
export default app
