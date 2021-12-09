package org.easyway.mapper;

import java.util.List;


import org.easyway.domain.chat.ChatMessageDTO;

public interface ChatMessageMapper {

	public List<ChatMessageDTO> getList(Long departmentId);
	public int insert(ChatMessageDTO message);
}
