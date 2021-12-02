package org.easyway.domain.project;

import com.sun.istack.internal.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Project {
	
	private long projectId;	
	private String projectName;
	private String projectStart;
	private String projectEnd;
	private String projectContent;

}
