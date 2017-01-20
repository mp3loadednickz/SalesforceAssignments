trigger testTrigger on Account ( before insert, before update,  before delete, after insert, after update ,after delete) {
    
		if(Trigger.isBefore)
		{
			if (Trigger.isInsert){System.debug(Trigger.new);
			
			
			
			
			
			if(CloneClass.runOnce()){
        		list<Account> clone= new list<Account>();
				for(Account a : Trigger.new){
				clone.add(new Account(Name=a.Name,BillingCity=a.BillingCity));				
				}
				insert(clone);
    	}
			
			
			}
			if (Trigger.isUpdate){System.debug(Trigger.new);System.debug(Trigger.old);}
			if (Trigger.isDelete)System.debug(Trigger.old);
			
		
		
		
		}
		
		if(Trigger.isAfter)
		{
			if (Trigger.isInsert)System.debug(Trigger.new);
			if (Trigger.isUpdate){System.debug(Trigger.new);System.debug(Trigger.old);}
			if (Trigger.isDelete)System.debug(Trigger.old);
		
		}
		
		
		
		
		
		
}