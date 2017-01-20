//class calculator to perform operations
public class Calculator {
    //method Operation values we pass operation to be performed and two operands
    public static void OperaterValues(String operation, Integer inp1 , Integer inp2)
	{

		if(operation=='SUM')
		{
    		Integer addition=inp1 + inp2;
	       	System.debug(operation+' is '+addition);
		}
		else if(operation=='SUB')
		{
	       	Integer substraction=inp1 - inp2;
	       	System.debug(operation+' is '+substraction);
		}
		else if(operation=='MUL')
		{
    		Integer multiplication=inp1 * inp2;
    		System.debug(operation+' is '+multiplication);
		}
		else if(operation=='DIV')
		{
            Integer div=inp1 / inp2;
            System.debug(operation+' is '+div);
		}
		else
		{
    		System.debug('Please Enter Valid Inputs');
		}
		
	}
}