pragma solidity ^0.5.0;


interface rewardinterface {
    function addMinters(address _contributor) external;
    function removeMinters(address _contributor) external;
    function isMinter(address _contributor) external returns(bool);
    function trigger() external returns (bool);
    function withdraw() external returns (bool);
}

contract CrowdFinal
{
    
    
    
     struct Contributor {
        bool isContributor;
        uint256 donation;
        
    }
    uint256 public goal;
    uint256 public milestone_size;
    uint256 public milestone_num;
    address public donarContractAddress;
    address payable owner;
    mapping(address => Contributor) public contributorsDB;
    rewardinterface rewardsContract;
    
    constructor(address _rewardsContract, uint256 _goal) public {
        rewardsContract=rewardinterface(_rewardsContract);
        if(!rewardsContract.isMinter(donarContractAddress)) {
            rewardsContract.addMinters(donarContractAddress);
        }
       milestone_num=5;
       owner=msg.sender;
       goal=_goal;
       milestone_size=goal/milestone_num;
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
         require(msg.value>0.01 ether,"Less than minimum amount");
         require(milestone_num!=5,"The campaign is over");
         contributorsDB[msg.sender].donation += msg.value;
         if(donarContractAddress.balance >= milestone_size) {
            milestone_num=milestone_num+1;
            rewardsContract.trigger();
            owner.transfer(donarContractAddress.balance);
        }
         
         
     }
    function withdraw()public isAuthorized 
    {
        rewardsContract.withdraw();
    }
    
    
}
