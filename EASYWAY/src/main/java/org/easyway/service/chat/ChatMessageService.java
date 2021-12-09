package org.easyway.service.chat;

import java.util.List;

import org.easyway.domain.chat.ChatMessageDTO;

public interface ChatMessageService {
	public int save(ChatMessageDTO message);
	public List<ChatMessageDTO> getListMessage(Long departmentId);
}
