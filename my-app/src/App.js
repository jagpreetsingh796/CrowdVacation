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
        <h2>Start own personalised campaign using ERC1973</h2>
      </div>

      <div className="hero"></div>

      <div className="section">
        <h3>Steps to start your campaign</h3>
        
        <ul>
            <li ><h4>Set your fundraising goal</h4></li>
            <li><h4>Add Participants</h4></li>
            <li><h4>Accept donations (minimum 1 ether)</h4></li>
            <li><h4>Donors get appropriate rewards</h4> </li>
        </ul>  
      </div>

      <div className="section">
        {/* <h4>Start your campaign</h4>   */}
        <CreateVacation/>
      </div>

      <div className="section">
        {/* <h4>AddContributor</h4>   */}
        <AddContributor/>
      </div>

      <div className="section">
        {/* <h4>RemoveContributor</h4>   */}
        <RemoveContributor/>
      </div>

      <div className="section">
        {/* <h4>Make Donation</h4>   */}
        <Donate/>
      </div>

      <div className="section">
        {/* <h4>Withdraw</h4>   */}
        <Withdraw/>
      </div>

      <div className="section">
        <p>&copy; Jagpreet Singh</p>
      </div>
    </div>
  );
}

export default App;
