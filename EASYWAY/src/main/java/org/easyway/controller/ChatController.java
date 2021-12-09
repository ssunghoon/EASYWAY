package org.easyway.controller;

import java.util.List;

import org.easyway.domain.chat.ChatMessageDTO;
import org.easyway.service.chat.ChatMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	ChatMessageService service;
	
	@GetMapping(value="/messagelist/{departmentId}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<?> chatList(@PathVariable Long departmentId){
        List<ChatMessageDTO> list = service.getListMessage(departmentId);
        return new ResponseEntity<List<ChatMessageDTO>>(list, HttpStatus.OK);
    }
}