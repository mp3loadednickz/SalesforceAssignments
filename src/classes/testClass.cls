/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class testClass {

   public static testMethod void m1() {
        // TO DO: implement unit test
        test.startTest();
        
        //test single record
        Account a1 = new Account(name='Nikhil',BillingCity='Amravati',phone='9370621246');
        insert(a1);
        test.stopTest();
        Account acc = [select name from Account where phone ='9370621246'];
        system.assertEquals(acc.Name,a1.name);
    }
    public static testMethod void m2(){
        // Create 20 Account records 
        test.startTest();
        list<Account> lstAccount = new list<Account>();
        for(Integer i = 1; i < 21; i++) {
                Account a = new Account();
                a.Name='Chirag'+i;
                a.BillingCity='Nashik';
                a.Phone='952323232'+i;
                lstAccount.add(a);
        }
        insert(lstAccount);
        test.stopTest();
        list<Account> phonelst = [select Name from Account where BillingCity='Nashik'];
        list<Account> lstAccountTest = lstAccount;
        Integer c = phonelst.size();
        system.assertEquals(40,c);
        system.assertNotEquals(50,c);
        
           
    }
    public static testMethod void m3() {
        // TO DO: implement unit test
        // Create 20 EFT_Transaction_Status__c records 
        test.startTest();
        list<EFT_Transaction_Status__c> lstAccount = new list<EFT_Transaction_Status__c>();
        EFT_Transaction_Status__c eft = new EFT_Transaction_Status__c();
        eft.Method_Name__c = 'Credit Card Address Verify';
        eft.Transaction_Status__c = 'DECLINED';
        
        
        
        
        test.stopTest();
        
    }
    
   public static testMethod void m4() {
        test.startTest();
        Contact c1=new Contact(AssistantName='ramdevbaba',phone='5454');
        insert(c1);
        Contact c2=new Contact(AssistantName='ramdevbaba k bache',phone='5454');
        insert(c2);        
        test.stopTest();
   }
}