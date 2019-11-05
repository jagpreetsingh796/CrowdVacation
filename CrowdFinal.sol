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
    
    constructor( address _rewardsContract,uint256 _goal) public {
        rewardsContract=Rewards(_rewardsContract);
        if(!rewardsContract.isMinter(donarContractAddress)) {
            rewardsContract.addMinters(donarContractAddress);
        }
       milestone_num=5;
       owner=tx.origin;
       goal=_goal;
       milestone_size=goal/milestone_num;
       milestone_size=milestone_size;
       donarContractAddress = address(this);
       
    }
    
    modifier isAuthorized() {
        require(contributorsDB[tx.origin].isContributor, "caller is not a authorized Contributor");
        _; 
    }
    function addContributor(address _contributor) public {
        require(!contributorsDB[tx.origin].isContributor, "contributor already added");
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
         contributorsDB[tx.origin].donation += msg.value;
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

contract Factory {
    
    uint public CrowdId;
    
    mapping(uint => CrowdFinal) CrowdFinalList;
    address  public rewards;
    uint256 goal;
    
   
    
    function deploy(uint256 _goal,address _rewards) public {
        CrowdId++;
        goal=_goal;
        rewards=_rewards;
       
      CrowdFinal f = new CrowdFinal(rewards,goal);
        CrowdFinalList[CrowdId] = f;
       
    }
    
    function getfactoryById(uint _id) public view returns (CrowdFinal) {
      return CrowdFinalList[_id];
    }
}

contract Dashboard
{
    
    uint public CrowdId;
    Factory public database;
   
      
      constructor(address _database) public {
        database = Factory(_database);
    }
    
    function newFactory(uint256 _goal,address _rewards) public  {
        
        CrowdId++;
        
        database.deploy(_goal,_rewards);
    }
    function getid()public view returns(uint)
    {
        return CrowdId;
    }
    function getaddContributorId(uint _id,address contributor) public  {
        CrowdFinal  f=CrowdFinal(database.getfactoryById(_id));
        f.addContributor(contributor);
       
       
    }
    
function getremoveContributorId(uint _id,address contributor) public  {
        CrowdFinal  f=CrowdFinal(database.getfactoryById(_id));
        f.removeContributor(contributor);
       
       
    }
function getdonatebyId(uint _id)  payable public  {
        CrowdFinal  f=CrowdFinal(database.getfactoryById(_id));
        f.donate.value(msg.value)();
       
       
    }
 function getwithdrawbyId(uint _id)  payable public  {
        CrowdFinal  f=CrowdFinal(database.getfactoryById(_id));
        f.withdraw();
       
       
    }   

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}