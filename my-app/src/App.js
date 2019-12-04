import React from 'react';
import CreateVacation from './CreateVacation'
import AddContributor from './AddContributor'
import RemoveContributor from './RemoveContributor'
import Donate from './Donate'
import Withdraw from './Withdraw'
import './App.css';

function App() {
  return (
    <div className="App">
      <div className="header-text">
        <h1>Crowd Sourcing</h1>
      </div>

      <div className="section">
        <h4>Create your contract here</h4>  
        <CreateVacation/>
      </div>

      <div className="section">
        <h4>AddContributor</h4>  
        <AddContributor/>
      </div>

      <div className="section">
        <h4>RemoveContributor</h4>  
        <RemoveContributor/>
      </div>

      <div className="section">
        <h4>Make Donation</h4>  
        <Donate/>
      </div>

      <div className="section">
        <h4>Withdraw</h4>  
        <Withdraw/>
      </div>

      <div className="section">
        <p>&copy; Jagpreet Singh (LAMBE NAAM WALA)</p>
      </div>
    </div>
  );
}

export default App;
