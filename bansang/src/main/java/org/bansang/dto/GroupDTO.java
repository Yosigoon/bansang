package org.bansang.dto;

import java.util.Date;

import lombok.Data;

@Data
public class GroupDTO {

	private Long groupNumber;
	private String groupName;
	private String groupLeader;
	private Long groupMemberCount;
	private Date registerDate;
}
