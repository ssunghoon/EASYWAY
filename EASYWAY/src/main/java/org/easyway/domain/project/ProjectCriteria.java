package org.easyway.domain.project;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

	@ToString
	@Setter
	@Getter
	public class ProjectCriteria {

	  private int pageNum;
	  private int amount;
	  
	  private String type;
	  private String keyword;

	  public ProjectCriteria() {
		  //1페이지에 게시글 10개만 보여주겠다
	    this(1, 15);
	  }

	  public ProjectCriteria(int pageNum, int amount) {
	    this.pageNum = pageNum;
	    this.amount = amount;
	  }
	  
	  public String[] getTypeArr() {
	    
	    return type == null? new String[] {}: type.split("");
	  }
//	  
//	  //url 줄여주기(인코딩)
//	  public String getListLink(){
//		  UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
//				  .queryParam("pageNum", this.getPageNum())
//				  .queryParam("amount", this.getAmount())
//				  .queryParam("type", this.getType())
//				  .queryParam("keyword", this.getKeyword());
//		  
//		  return builder.toUriString();
//	  }
}
