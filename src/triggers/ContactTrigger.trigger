trigger ContactTrigger on Contact (before insert) {
    
    
    list<Contact> lstCon = [SELECT phone,email FROM Contact];
		
		for(Contact c : Trigger.new)
			{
				for(Contact c1 : lstCon)
				{
					if(c1.phone==c.phone && c1.email==c.email) 
					c.phone.addError('Duplicate email and phone.');
					if(c1.email==c.email)
					c.phone.addError('Duplicate email.');
					if( c1.phone==c.phone)
					c.phone.addError('Duplicate phone.');
					
								
				}
			
			}	
    
    
    
        
}