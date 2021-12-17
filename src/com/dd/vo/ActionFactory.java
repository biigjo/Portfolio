package com.dd.vo;

import com.dd.vo.Action;
import com.dd.vo.ActionFactory;

public class ActionFactory {
	private static final ActionFactory instance = new ActionFactory(); 
	private ActionFactory() { }
	static ActionFactory getInstance() {
		return instance;
	}
	
	Action getAction(String command) {
		Action action = null;
		switch(command) {
		case "Join":
			action = new JoinAction();
			break;
		case "Login":
			action = new LoginAction();
			break;
		case "DictionaryAction":
			action = new DictionaryAction();
			break;
		case "CommunityAction":
			action = new CommunityAction();
			break;
		case "BoardPicAction":
			action = new BoardPicAction();
			break;
		case "MsgWriteAction":
			action = new MsgWriteAction();//잠시만여 이거 command 일관성이 있어야하니까 action으로 할게요
			break;
		case "MsgReceiveAction":
			action = new MsgReceiveAction();
			break;
		}
		return action;
	}
}
