pragma solidity ^0.5.0;


import "./Rewards.sol";

contract CrowdFinal
{
    
    
    
     struct Contributor {
        bool isContributor;
        uint256 donation;
        
    }
    uint256 public goal;
    uint256 public milestone_size;
    uint256 public milestone_num;
    address public donarContractAddress=address(this);
    uint public balance;
    address payable public owner;
    mapping(address => Contributor) public contributorsDB;
    Rewards public rewardsContract;
    
    constructor(address _rewardsContract, uint256 _goal) public {
        rewardsContract=Rewards(_rewardsContract);
        if(!rewardsContract.isMinter(donarContractAddress)) {
            rewardsContract.addMinters(donarContractAddress);
        }
       milestone_num=5;
       owner=msg.sender;
       goal=_goal;
       milestone_size=goal/milestone_num;
       milestone_size=milestone_size;
       donarContractAddress = address(this);
       
    }
    
    modifier isAuthorized() {
        require(contributorsDB[msg.sender].isContributor, "caller is not a authorized Contributor");
        _; 
    }
    function addContributor(address _contributor) public {
        require(!contributorsDB[msg.sender].isContributor, "contributor already added");
        contributorsDB[_contributor].isContributor = true;
        
    }
    
     function removeContributor(address _contributor) public {
        require(contributorsDB[_contributor].isContributor, "contributor already removed");
        contributorsDB[_contributor].isContributor = false;
    }
    
     function donate() public isAuthorized payable
     {
         require(msg.value>0.01 ether,"Lower bound");
         require(msg.value<3 ether,"Upper bound");
         require(milestone_num!=0,"The campaign is over");
         balance=donarContractAddress.balance/(1 ether) ;
         contributorsDB[msg.sender].donation += msg.value;
         if(balance >= milestone_size) {
            milestone_num=milestone_num-1;
            rewardsContract.trigger();
            owner.transfer(donarContractAddress.balance);
             balance=0;
        }
         
         
     }
    function withdraw()public isAuthorized 
    {
        rewardsContract.withdraw();
    }
    
    
}
