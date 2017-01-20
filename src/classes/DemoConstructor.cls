public abstract class DemoConstructor {
  public DemoConstructor(){
    System.debug('This is a Constructor');
    }
    public virtual void write() 
    {
       System.debug('Writing some text in DemoConstructor');
    }
    public abstract void abstractMethod();
 // this abstract method for next assignment and this method should be implemented in sub class   
    
}
// virtual used for inheritance in 4th assignment