public class DemoInheritance extends DemoConstructor{
     public override void write() 
    {
    	super.write(); // just to import write function FROM super class
       System.debug('Writing some text in DemoInheritance');
    }
     public override void abstractMethod()
     {
		     System.debug('This is body of Abstract method in DemoInheritance.');
     }
    
}