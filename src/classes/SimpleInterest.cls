public class SimpleInterest {
    
    public static void calculateSimpleInterest(Decimal Amount, Decimal Rate, Integer Period)
    {
           if(Amount>0 && Rate>0 && Period>0){
		      Decimal Interest = Amount * period * Rate ;
		      Decimal SimpleInterest = Interest/100;
		      System.debug(SimpleInterest);
		      Decimal TotalInterest= SimpleInterest + Amount;
    		  System.debug('Your amount '+Amount+' at the rate of '+Rate+'% for '+Period+' year is calculated as '+TotalInterest);
           }
           else{
           System.debug('Value cannot be negative.');
           }
    }
    
}