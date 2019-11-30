import React from 'react';
import CreateVacation from './CreateVacation'
import AddContributor from './AddContributor'
import RemoveContributor from './RemoveContributor'
import Donate from './Donate'
import './App.css';

function App() {
  return (
    <div className="App">
      <h4>Create your contract here</h4>  
      <CreateVacation/>
      <h4>AddContributor</h4>  
      <AddContributor/>
      <h4>RemoveContributor</h4>  
      <RemoveContributor/>
      <h4>Make Donation</h4>  
      <Donate/>

    </div>
  );
}

export default App;
