public class TestQuery {
   
    public static void printAccountRecords()
     {
        Integer i=0,j=0;
    	list<Account> myAccount = new list<Account>();
  		myAccount=[SELECT Name, BillingCity FROM Account];
  		
  		for( i=0;i<myAccount.size();i++){
  		System.debug(i+' '+myAccount);
  		}
  		for(Account acc : [SELECT Name, Id FROM Account])
  	 	{
  	 	  		System.debug(acc);	
  	 	}
  	 	while(myAccount.size()>j){
  		System.debug(j+' '+myAccount);
  		j++;
  		}
     }
     public static void printLeadRecordId()
     { 	 	
  	 	// second 
  	 	set<Lead> myLead = new set<Lead>();  		
 		for(Lead l : [SELECT Id FROM Lead])
  		{
  		myLead.add(l);	
  		System.debug(l);
  		}
     }
     public static void eternusAccountContacts()
     {
  	 		
    	 //child parent relationship used here contact as child and parent as Account
    	list<Contact> myContact = new list<Contact>();
    	for(Contact c:[SELECT Account.Id FROM Contact WHERE Account.Name='Eternus' ]){
     		myContact.add(c);
        }
  		System.debug('contacts associated with this account:::::'+myContact.size());
  		Account Eter=[SELECT id, Name, ContactCount__c FROM Account WHERE Name='Eternus'];
  		Eter.ContactCount__c=myContact.size();
    	try{
  	     	System.debug('Hey! ContactCount  updated.');
	       	update Eter;
    	}
    	catch(DmlException e){
  	     	System.debug('Error! ContactCount not updated.');
  	    }
     }
    
     public static void leadStatusUpdate()
     {
  	
  	     //9.4
  	     list<Lead> StatusLead = new list<Lead>();
  	     for(Lead l1:[SELECT Id, Name FROM Lead WHERE Status='Closed - Not Converted']){
        	StatusLead.add(l1);  	
        	l1.Status='Closed - Converted';
         }
  		 try{
  		     System.debug('Hey! Status updated.');
	  		 update StatusLead;
	  	 }
         catch(DmlException e){
  	         System.debug('Error! Status not updated.');
  		 }
      }	
      
  	  	//parent child relationship in second used
  	  	
  	 public static void recordCreatedDateToday()
     {
         //the Account records WHERE Created Date = Today 	
  	     set<Account> RecordsCreatedToday = new set<Account>();
  	     for(Account a :[SELECT Id,Name FROM Account WHERE CreatedDate=TODAY ]){
		      RecordsCreatedToday.add(a);
		      System.debug('Hi This is me.');
		      System.debug(a);	  	
  		 }
     }
      
     public static void dynamicQuery()
     {
        //db query
        Integer i=0;
  		String myTestString = 'Eternus';
		list<Account> findAccount = Database.query('SELECT Id FROM Account WHERE Name =:myTestString');
  		for(i=0;i<findAccount.size();i++){
      		System.debug(findAccount);
  		}    
  		
  		//db search
        String searchquery='FIND \' Eter* \' IN ALL FIELDS RETURNING Account(id,name),Contact(name), Lead(name)';
  		list<list<SObject>> searchlist = search.query(searchquery);
  		for(i=0;i<searchlist.size();i++){
  		    System.debug(searchlist);
  		}
  	}	    
}