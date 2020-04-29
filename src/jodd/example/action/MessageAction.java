package jodd.example.action;

import jodd.example.model.Message;
import jodd.example.service.AppService;
import jodd.madvoc.meta.Action;
import jodd.madvoc.meta.In;
import jodd.madvoc.meta.MadvocAction;
import jodd.petite.meta.PetiteInject;

@MadvocAction
public class MessageAction {

    @PetiteInject
	AppService appService;

    @Action
    public void view() {
    }
    
    @In
	Message message;

    @Action(extension="do", method="POST")
    public String add() {
        appService.addMessage(message);
        return "redirect:/<index>";
    }
}