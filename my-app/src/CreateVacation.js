import React from "react"
import firebase from './Firestore'
import { ethers } from 'ethers';
import Loader from 'react-loader-spinner'



class CreateVacation extends React.Component
{
    constructor()
    {
        super()
        this.state={
            
            Name:"",
            Goal:"",
            Id:"",
            // loading1: false,
            // loading2:false,
           
        }
        this.handlechange=this.handlechange.bind(this)
        this.handlesubmit=this.handlesubmit.bind(this)
        // this.handlesubmit1=this.handlesubmit1.bind(this)
    }
    handlechange=(e) =>
    {
        this.setState({
            [e.target.name]:e.target.value
        },console.log(this.state))
    }
    handlesubmit= async(e)=>
    {
        e.preventDefault();
        const db = firebase.firestore();
        const userRef = db.collection("users").add({
            Id: 1,
            Name:this.state.Name,
            
            
            
          });
          
        

    }
    render()
    {
        return(
            <div>
                <form onSubmit={this.handlesubmit}>
                <input  type="text"  name="Name"  label="Name" onChange={this.handlechange} value={this.state.Name} placeholder="Enter Name"/>
                 <input type="text"  name="Goal" label="Goal" onChange={this.handlechange}  value={this.state.Goal} placeholder="Enter Amount (ex. ETH)"/>
                 <button type="submit" >Submit</button>


                </form>
            </div>
        )
    }

}

export default CreateVacation