package org.easyway.controller;

import org.easyway.domain.chat.ChatMessageDTO;
import org.easyway.service.chat.ChatMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class ChatMessageController {
	
	@Autowired
	SimpMessagingTemplate simpMessagingTemplate;
	
	@Autowired
	ChatMessageService chatMessageService;

	@MessageMapping("/talk/send")
    public void sendMsg(ChatMessageDTO message) throws Exception {
        System.out.println("샌드 메세지 실행");
        Long departmentId = message.getDepartmentId();
        chatMessageService.save(message);
        simpMessagingTemplate.convertAndSend("/topic/" + departmentId,message);
    }
}
