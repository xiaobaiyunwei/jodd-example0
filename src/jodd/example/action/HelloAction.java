package jodd.example.action;

import jodd.madvoc.meta.Action;
import jodd.madvoc.meta.In;
import jodd.madvoc.meta.MadvocAction;
import jodd.madvoc.meta.Out;

@MadvocAction
//("foo/boo")
public class HelloAction {
	  @In
      String name;

      @Out
      String value;

      @Action
      public String world() {
          System.out.println("HelloAction.world " + name);
          value = "Hello World!";
          return "ok";
      }
      
      @Action("test/world")
      public String china() {
          System.out.println("HelloAction.China " + name);
          value = "Hello World!";
          return "ok";
      }
      
}
