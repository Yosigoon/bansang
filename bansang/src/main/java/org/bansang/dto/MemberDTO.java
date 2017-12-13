package org.bansang.dto;

import lombok.Data;

@Data
public class MemberDTO {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberImage;
	private String memberToken;
}
