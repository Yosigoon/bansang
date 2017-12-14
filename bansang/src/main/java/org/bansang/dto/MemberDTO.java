package org.bansang.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {

	String memberId;
	String memberPw;
	String memberName;
	String memberImage;
	String memberToken;
	Date registerDate;
}
