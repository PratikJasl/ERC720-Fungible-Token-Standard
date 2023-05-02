// SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;
import "./AccessControl.sol";
contract PJToken is AccessControl
{
    string private _Name;
    string private _Symbol;
    uint32 private _Decimal;
    uint256 private _TotalSupply;
    address payable public _Owner;
    uint256 private _cap;
    mapping (address => uint) private _Balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    constructor(string memory name_, string memory symbol_, uint256 cap_)
    {
        _Name = name_;
        _Symbol = symbol_;
        _cap = cap_;
        _Owner = payable(msg.sender);
    }

 /* --------------The functions below display the Name and Symbol of the token---------------*/
 function TokenName() public view returns (string memory) 
 {
    return(_Name);
 }
 function TokenSymbol() public view returns (string memory)
 {
     return(_Symbol);
 }


 /* ---------------The function below will specify the decimal space of the Token-------------*/
 function Decimal() public pure returns (uint32)
 {
     return 18;
 }


 /* ---------------The function below will display the total supply of Tokens------------------*/
 function TotalTokens() public view returns(uint)
 {
     return(_TotalSupply);
 }


 /*-----------------The funciton below will display the token cap -------------------------*/
 function Cap() public view returns(uint)
 {
     return(_cap);
 }


/*The function below is used to check the Balance of the accounts, we maintain a map to hold the
balances of all the accounts -------------*/
function CheckBalance(address account) public view returns(uint)
 {
    return(_Balances[account]);
 }



/*-----------The Function belown is used to Transfer Tokens from one account to another.------------*/
 function transfer(address _To, uint256 _Amount) public returns (bool)
 {
     address _From = msg.sender;
     _transfer(_From,_To,_Amount);
     return(true);
 }

function _transfer(address From, address To , uint256 Amount) private 
 {
     require(From != address(0),"Aborting!!! The Senders address is Empty.");
     require(To != address(0),"Aborting!!! The Receivers address is Empty");
     uint From_balance = _Balances[From];

     require(From_balance >= Amount,"Aborting!!! Transfer amount is greater than Balance");
     {
       _Balances[From] -= Amount;
       _Balances[To] += Amount;
     }
 }


 /* This Funciton is used to give allownaces, the spender will be able to spend a cretain amount which the 
 owner has allowed him to spend once he gets the allowance.*/
 function allowance(address _spender, uint256 _amount) public
 {
     address _owner = msg.sender;
     _allowances[_owner][_spender];
     approval(_owner, _spender, _amount);
 }
 function approval(address owner, address spender, uint256 amount) private returns(bool)
 {  
     require(owner != address(0),"Aborting!!! Invalid Owner Address");
     require(spender != address(0),"Aborting!!! Invalid Spender Address");
     _allowances[owner][spender] = amount;
     return(true);
 }



 /*---------This function is used to spend the allowance given to a certain account.-----------------*/
 function SpendAllowance(address _owner, uint256 _amount) public virtual returns(bool)
 {
     address _spender = msg.sender;
     uint256 Allowedamount = _allowances[_owner][_spender];
     require(_amount <= Allowedamount,"Aborting!!! Trying to spend more than allowed");
     approval(_owner, _spender, Allowedamount - _amount);
     _transfer(_owner, _spender, _amount);
     return(true);
 }

 /* ----------This Function is used to increase allowance given to an account.----------------------*/
 function IncreaseAllowance(address _spender, uint256 _amount) public virtual returns(bool)
 {
     address _owner = msg.sender;
     allowance(_spender,_allowances[_owner][_spender] + _amount);
     return(true);
 }
  /* ----------This Function is used to increase allowance given to an account.----------------------*/
 function DecreaseAllowance(address _spender, uint256 _Subamount) public virtual returns(bool)
{
    address _owner = msg.sender;
    uint256 TotalBalance = _allowances[_owner][_spender];
    require( TotalBalance >= _Subamount,"Aborting!!! Not enough Funds to remove all funds are send");
    allowance(_spender,_allowances[_owner][_spender] - _Subamount);
    return(true);
}


 /*------This funciton is used to Mint new coins, and transfer the coin to the account of the owner-----*/
 function Mint(address account, uint256 amount) public OnlyMiner returns(bool)
 {
     
     require(_TotalSupply + amount <= _cap,"Abortung!!! Reached Cap Cannot mint more tokens");
     _TotalSupply += amount;
     {
         _Balances[account] = amount;
     }
     return(true);
 }


 /*-------This function is used to Burn the tokens, and delete some tokens from the burners account--------*/
 function Burner(address account, uint256 amount) public OnlyBurner returns(bool)
 {
     uint accountBalance = _Balances[account];
     require(accountBalance >= amount,"Aborting!!! Not enough tokens to burn");
     _Balances[account] -= amount;
     _TotalSupply -= amount;
     return(true);
 }

}