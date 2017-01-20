public class ArrayClass {
    
    public static void IntegerArray()
    {
      
      List<Integer> ArrayIntegerElements = new list<Integer>{1,5,2,3,1};

	ArrayIntegerElements.sort();System.debug(ArrayIntegerElements);    	
	for(Integer i=4;i>-1;i--)
			{
			System.debug(ArrayIntegerElements[i]);
			}
    Integer minvalue = ArrayIntegerElements [0];			
    Integer maxvalue = ArrayIntegerElements [0];
        for (Integer i = 1;i<5;i++)
        {
             if( ArrayIntegerElements[i] < minvalue)
                minvalue = ArrayIntegerElements[i];
            if( ArrayIntegerElements[i] > maxvalue)
                maxvalue = ArrayIntegerElements[i];             
        }    
System.debug('the max value is '+maxvalue);
System.debug('the min value is '+minvalue);  

//  List<Integer> ArrayIntegerElements = new Integer[5];
Integer c=1;
map <Integer, Integer> myMap = new map<Integer,Integer>();
for (Integer i = 0;i<5;i++)
	{
		
		if(myMap.containsKey(ArrayIntegerElements[i]))
		{	
			c++;
			myMap.put(ArrayIntegerElements[i],c);
		}	
		else{
		myMap.put(ArrayIntegerElements[i],1);
		}
	  // System.debug(ArrayIntegerElements[i]+':'+myMap.get(ArrayIntegerElements[i])+'\n');    
	 }
    
    set<Integer> num = new  set<Integer> ();
    list<Integer> cnt = new  list<Integer>();
    num= myMap.keyset();
     System.debug(num);
    cnt=myMap.values();
    for(Integer i : num)
    {
        System.debug(i+':'+myMap.get(i));
    }
    }
}