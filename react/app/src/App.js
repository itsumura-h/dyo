import React from 'react';
import Hello from './components/Hello.js'
import Welcome from './components/Welcome.js'

const App=()=>{
  const title = 'React'
  return (
    <div>
      <Hello title={title}/>
      <Welcome />
    </div>
  );
}
export default App;
