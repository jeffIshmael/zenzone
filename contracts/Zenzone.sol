// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract zenzone{

uint totalProposals;
uint totalcompany;

//struct of the company thats needs carbon credits.
struct Buyer {
uint buyerId;
string compName;
uint regPin;
string category;
string description;
address buyerAdd;
string email;
uint phoneNo;
}

//array of buyers
Buyer[] public buyers;

//struct of the one rehabilitating envt.
struct Offsetter{
uint offsetterId;
string compName;
uint regPin;
string category;
string offSetCat;
string description;
address offsetterAdd;
string email;
uint phoneNo;
}

Offsetter[] public offsetters;

mapping (uint => Buyer) BuyernId;
mapping (uint => Offsetter) OffsetternId;

// event emitted when offsetter is registered
event offsetterRegestered(uint offsetterId,
string compName,
uint regPin,
string category,
string offSetCat,
string description,
address offsetterAdd,
string email,
uint phoneNo);

//event of a registered user
event buyerRegistered(uint buyerId,
string compName,
uint regPin,
string category,
string description,
address buyerAdd,
string email,
uint phoneNo);

//struct for offset proposal
struct offSetProposal{
uint proposalId;

}

//struct for buyer proposal
struct buyerProposal{
uint proposalId;

}

//function to register offsetter
function regBuyer( string memory _compName,uint _regPin,string memory _category,string memory _description,string memory _email,uint _phoneNo) public {
require(!registeredBuyer(msg.sender), "You are already registered as an offsetter");
require(!registeredBuyer(msg.sender), "You are already registered as a buyer");
uint _buyerId = totalcompany;
Buyer storage newBuyer = BuyernId[_buyerId];
newBuyer.buyerId = _buyerId;
newBuyer.compName = _compName;
newBuyer.category= _category;
newBuyer.regPin = _regPin;
newBuyer.description = _description;
newBuyer.buyerAdd = msg.sender;
newBuyer.email = _email;
newBuyer.phoneNo= _phoneNo;

buyers.push(newBuyer);
totalcompany++;
emit buyerRegistered(_buyerId, _compName, _regPin, _category, _description, msg.sender, _email, _phoneNo);
}

//function to register buyer
function regoffsetter( string memory _compName,uint _regPin,string memory _category,string memory _offSetCat,string memory _description,string memory _email,uint _phoneNo)
public {
require(!registeredBuyer(msg.sender), "You are already registered as an offsetter");
require(!registeredBuyer(msg.sender), "You are already registered as a buyer");
uint _offsetterId = totalcompany;
Offsetter storage newOffsetter = OffsetternId[_offsetterId];
newOffsetter.offsetterId = _offsetterId;
newOffsetter.compName = _compName;
newOffsetter.regPin = _regPin;
newOffsetter.category = _category;
newOffsetter.offSetCat = _offSetCat;
newOffsetter.description = _description;
newOffsetter.offsetterAdd = msg.sender;
newOffsetter.email = _email;
newOffsetter.phoneNo = _phoneNo;

offsetters.push(newOffsetter);
emit offsetterRegestered(_offsetterId, _compName, _regPin, _category, _offSetCat, _description, msg.sender, _email, _phoneNo);
}

//function to check if an address is registered
function registeredBuyer( address _myadd) public view returns(bool){
for (uint i=0; i < totalcompany; i++ ){
if( BuyernId[i].buyerAdd == _myadd ){
return true;
}
}
return false;}

//function to check if an address is registered
function registeredOffsetter( address _myadd) public view returns(bool){
for (uint i=0; i < totalcompany; i++ ){
if( OffsetternId[i].offsetterAdd == _myadd){
return true;
}
}
return false;
}

//function to make a proposal
// function Buyproposal() public {
// require(registeredBuyer(msg.sender), "Please register as a buyer");
// uint _proposalId = totalProposals;

// }






}
