package org.easyway.domain.project;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectPost {
	
	private long projectPostId;
	private long projectBoardId;
	private long projectMemberId;
	private String projectPostTitle;
	private String projectPostContent;
	private String projectPostFilePath;
	private String projectPostDate;

}
