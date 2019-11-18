import React from "react"
import firebase from './Firestore'
import { ethers } from 'ethers';
import Loader from 'react-loader-spinner'

class AddContributor extends React.Component
{
    constructor()
    {
        super()
        this.state={
            
            Address:"",
            
            Id:"",
            
           
        }
        this.handlechange=this.handlechange.bind(this)
        this.handlesubmit=this.handlesubmit.bind(this)
        
    }
    handlechange=(e) =>
    {
        this.setState({
            [e.target.name]:e.target.value
        },console.log(this.state))
    }
    handlesubmit= async(e)=>
    {

    }
    render()
    {
        return(
            <div>
                <form onSubmit={this.handlesubmit}>
                <input  type="text"  name="Address"  label="Address" onChange={this.handlechange} value={this.state.Address} placeholder="Enter Address"/>
                <input  type="text"  name="Id"  label="Id" onChange={this.handlechange} value={this.state.Id} placeholder="Enter Id"/>
                
                 <button type="submit" >Submit</button>


                </form>
            </div>
        )
    }
}
export default AddContributor