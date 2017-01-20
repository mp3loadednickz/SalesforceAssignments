public class Acc {
    list<Account> lstAccount = [  SELECT
                                        ID,
                                        NAME,
                                        PHONE,
                                        BillingCity
                                  FROM    
                                        ACCOUNT];
    public list<Account> getm1(){
    return lstAccount;
    }
}

