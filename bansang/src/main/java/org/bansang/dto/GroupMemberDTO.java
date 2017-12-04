package org.bansang.dto;

import lombok.Data;

@Data
public class GroupMemberDTO {

	private Long groupNumber;
	private String memberName; 
	private String memberEmail; 
	private String membership;

}
