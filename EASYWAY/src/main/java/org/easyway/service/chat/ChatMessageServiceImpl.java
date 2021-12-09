package org.easyway.service.chat;

import java.util.List;

import org.easyway.domain.chat.ChatMessageDTO;
import org.easyway.mapper.ChatMessageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatMessageServiceImpl implements ChatMessageService{

	@Autowired
	ChatMessageMapper mapper;
	
	@Override
	public int save(ChatMessageDTO message) {
		return mapper.insert(message);
	}

	@Override
	public List<ChatMessageDTO> getListMessage(Long departmentId) {
		return mapper.getList(departmentId);
	}
}
