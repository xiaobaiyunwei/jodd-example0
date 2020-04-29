package jodd.example.action;

import jodd.example.model.Message;
import jodd.example.service.AppService;
import jodd.madvoc.meta.Action;
import jodd.madvoc.meta.MadvocAction;
import jodd.madvoc.meta.Out;
import jodd.petite.meta.PetiteInject;

import java.util.List;

@MadvocAction
public class IndexAction {

    @PetiteInject
	AppService appService;

    @Out
	List<Message> messages;

	@Action(alias = "index")
    public void view() {
        messages = appService.findLastMessagesWithResponses(10);
    }
}


