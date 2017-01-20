trigger AVS on EFT_Transaction_Status__c (after insert) {
    
    list<Case> lstCase= new list<Case>();
    
     for (EFT_Transaction_Status__c eft : Trigger.new)
    	{
    		
    		
    		if(eft.Method_Name__c=='Credit Card Address Verify' && eft.Transaction_Status__c=='DECLINED' && eft.SalesHeader__r.Status__c=='OPEN')
    		// 
  		  		{
  		  			Case c = new Case();
  		  			
  		  			c.Origin='Internal';
  		  			//c.Owner=AVS.Name;
  		  			c.Reason='Address did not verify';
  		  			c.Priority='High';
  		  			c.Status='New';
  		  			c.Type='Address did not verify';
  		  			c.Subject=Account.Name +' '+Case.Type;
  		  			
  		  			
    			lstCase.add(c);
  		  		}
   	 	
   	 	}		
    try{
    insert (lstCase);
    }
    catch(DMLException e)
    {
    System.debug('Insert Failed.');
    }
    
}