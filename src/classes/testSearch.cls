public with sharing class testSearch {
	
	public	String searchText{get;set;}
		
   list<list<SObject>> searchQuery =[find 'searchText' in all fields returning Account(Name),Contact(Name,FirstName,LastName),Lead(Name,FirstName,LastName),Opportunity(Name)];
  
	
	public list<list<SObject>> getm1(){
	return searchQuery;
	}
	
	
	
}