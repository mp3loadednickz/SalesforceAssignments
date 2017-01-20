public class Summation{	
    public static void ArrayLimit(Integer length) 
    {
    	Integer sum=0; 
        Integer[] myArray = new List<Integer>(length);
        for(Integer i=0;i<myArray.size();i++)
        {   
			       	     
        	myArray[i]=4;     
            System.debug(myArray[i]);
            
           
        } 
        for(Integer i=0;i<length+1;i++)
        {
        sum=sum+i;
        }
         System.debug('The summation is '+sum);
    }    
 }