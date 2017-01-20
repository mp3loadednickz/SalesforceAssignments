// This class have method ArrayLimit which limits the size of Array
public class ArrayLimitClass
{
    //Method ArrayLimit takes int length as a parameter and gives Array of that parameter limit.
        public static void ArrayLimit(Integer length){
            Integer sum=0; 
            Integer[] myArray = new List<Integer>(length);
            for(Integer i=0;i<myArray.size();i++)
            {   
                myArray[i]=4;
                System.debug(myArray[i]);
                sum+=i;
            } 
            System.debug('The summation of numbers FROM zero to parameter number is '+sum);
        }    
}