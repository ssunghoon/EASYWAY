package org.easyway.domain.project;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectBoard {
	
	private long projectBoardId;
	private long projectId;
	private String projectBoardName;

}
