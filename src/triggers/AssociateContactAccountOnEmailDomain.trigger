
trigger AssociateContactAccountOnEmailDomain on Contact (before insert) {
 
    List<String> Emaildomains = new List<String>();
    for(Contact con : Trigger.new) {
    		Emaildomains.add(con.Email.split('@').get(1));
    	}
    	
    Map<String, Id> EmailDomainAccountIdMap = new Map<String, Id>();
    for(Account a :[SELECT Id, Site FROM Account WHERE Site LIKE :EmailDomains])  {
        EmailDomainAccountIdMap.put(a.Site, a.Id);
    }

    for(Contact contact :Trigger.new) {
            
                if((EmailDomainAccountIdMap.keyset()).contains(Emaildomains)) {
                	 contact.Account= EmailDomainAccountIdMap.get();
                }
            

    }
    	
}
