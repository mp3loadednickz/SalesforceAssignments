//SOQL queries
public class TestSoql {
   
   public static void printContactRecords()
   {
    	list<Contact> listContact=[SELECT 
    	                                   name,
    	                                   Id
    	                           FROM 
    	                                   Contact
    	                          ];
    	System.debug(listContact);
   }
   public static void printActiveUsers() {
  	 	map<String,User> idUserMap =new map<String,User>();
   		for(User u:[SELECT 
   		                   ID,
   		                   Name 
   		            FROM   
   		                   User
   		            WHERE  
   		                   IsActive=true
   		]) {
   		   idUserMap.put(u.ID,u);
   		}
    	System.debug(idUserMap);
   }
   public static void MapAccountA() {
   		map<String,String> accountNameAccountIdMap = new map<String,String>();
   		for(Account ac:[SELECT 
   		                       id,
   		                       name 
   		                FROM   Account
   		]) {
   		   accountNameAccountIdMap.put(ac.name,ac.id);
   		}
   		System.debug(accountNameAccountIdMap);
   }
   public static void MapAccountB()
   {
        map<String,  Account> accountIdAccountObjectMap = new map<String, Account>();
    	list<Account> Acco=[SELECT Id,name,billingcity FROM Account];
   		for(Account ac: Acco){
   		   accountIdAccountObjectMap.put(ac.Id, ac);
   		}
   		System.debug(accountIdAccountObjectMap);
   }
   public static void yearWiseRecord()
   {
   		list<Account> EnrollYear2010 = new list<Account>();
   		for(Account ey: [SELECT 
   		                       Id,
   		                       name 
   		                 FROM  
   		                       Account 
   		                 WHERE 
   		                       EnrollmentYear__c 
   		                INCLUDES
   		                       ('2010')
   		]){
   		   EnrollYear2010.add(ey);
   		}
   		System.debug(EnrollYear2010);
   }
   public static void yearWiseRecord2()
   {
   		list<Account> EnrollYear=new list<Account>();
   		for(Account ey1: [SELECT Id,name FROM Account WHERE EnrollmentYear__c
   		                    includes('2013','2014')]){
   		    EnrollYear.add(ey1);
   		}
   		System.debug(EnrollYear);
   }
   public static void accountBillingState()
   {
   		list<Account> BillingState=new list<Account>();
	   	for(Account bs: [SELECT Id,name,BillingCity FROM Account WHERE BillingState
	   	                    not IN ('Maharashtra','Kerela') order by BillingState DESC
	   	                    limit 10000] ){
	   	    BillingState.add(bs);
   		}
	   	System.debug(BillingState);	
   }
   public static void amountGreater10k()
   {
   		list<Opportunity> listOpportunity =new list<Opportunity>() ;
		for(Opportunity o :[SELECT id,name FROM Opportunity WHERE Amount >10000 
		                      order by CreatedDate ASC limit 150 offset 50 all rows] ){
		    listOpportunity.add(o);
		}
		System.debug(listOpportunity);  
   }  
   
   
   // Relationship Query
   
   
   //Aggregate Functions
   public static void closedOpportunitiesCurrentYear()
   {
       	map<Integer, Integer> FiscalYearSumAmountMap = new map<Integer, Integer>();
   	    AggregateResult[] result = [SELECT sum(amount) s, FiscalYear FROM Opportunity 
   	                                WHERE StageName like 'closed*' group by FiscalYear];
   	    for(AggregateResult r : result){
   	    	FiscalYearSumAmountMap.put((Integer)r.get('FiscalYear'),(Integer)r.get('s'));
   	    }
   	    System.debug(FiscalYearSumAmountMap);
   }
   
   
    public static void distinctLeadRecords()
  	{
   		AggregateResult[] result = [SELECT company, COUNT_DISTINCT(LEADSOURCE) FROM lead 
   		                           group by company having COUNT_DISTINCT(LEADSOURCE) >10];
   		for(AggregateResult r : result){
   			System.debug(r);
   		}
  	}
  
  
  public static void statusLead()
  	 {
   		map<String, Integer> statusSumAmountMap = new map<String, Integer>();
   		AggregateResult[] result=[SELECT status,COUNT(Id) total,LEADSOURCE FROM lead 
   		                           group by status, LEADSOURCE];
   		for(AggregateResult r : result)
   			statusSumAmountMap.put((String)r.get('status'),(Integer)r.get('total'));
		map<String, map<String, Integer>> map2=new map<String, map<String, Integer>>();
		for(AggregateResult r : result)
			map2.put((String)r.get('LEADSOURCE'),statusSumAmountMap);
		System.debug(map2);
  	 }
 
 //Child to Parent
 	public static void contactIndustry()
   	{
  		list<Contact> industryMediaActiveContacts = [SELECT Account.Name, id 
  		                                               FROM
  		                                                    Contact 
  		                                              WHERE 
  		                                                    Account.Industry='Media'
  		                                              and 
  		                                                    Account.Active__c='true'];
  		System.debug(industryMediaActiveContacts);
   	}
   	public static void cNameJohn()
   	{
		list<C__c> parentNameJohn=[SELECT CtoA__r.Name FROM C__c WHERE CtoA__r.name='John' ];
		System.debug(parentNameJohn);
   	}
	
	//Parent to Child
	public static void printAccountContact()
   	{
		list<Account> accList = [SELECT Name,SLA__c,(SELECT Phone, Fax FROM Account.Contacts 
		                          WHERE FirstName='John') FROM Account ];
		System.debug(accList);
   	}														
	public static void accountOpportunityClosedWon()
   	{
		list<Account> oppList = [SELECT Id ,Name,(SELECT  Amount FROM Account.Opportunities 
		                          WHERE StageName='Closed Won') FROM Account];
		System.debug(oppList);
   	}
	public static void aNameJohn()
	{
		list<A__c> aList = [SELECT Name,(SELECT Name FROM CtoA__r WHERE Name='John') FROM A__c];
		System.debug(aList);
   	}
   	
   	//Sosl Queries
   	public static void testSearch()
   	{
		list<list<sObject>> sosl= [find 'test' IN Name fields 
		      returning Contact,Lead,User,Account]; 		
  		System.debug(sosl);
   	}
   	
   	//DML Operations
   	public static void uniqueAccountName()
  	 {	
		list<Account> addAccounts = new list<Account>();
		for(Integer i =0;i<100;i++){
			Account a = new Account(Name='Nick'+i,BillingCity='NY');
			addAccounts.add(a);
		}
		try{
			insert addAccounts;
		}
		catch(DMLException e){
		System.debug('Insertion of Account Failed');
		}
  	 }
   
	public static void deleteInActiveAccounts()
  	 {
		list<Account> accDelete =[SELECT id, name FROM Account 
		                          WHERE Active__c='No'
		                          and CreatedDate= Last_N_Days:90 ];
		try{
			System.debug('Deletion of Account Success');
			delete accDelete;
		}
		catch(DMLException e){
			System.debug('Deletion of Account Failed');
		}
  	 }
}