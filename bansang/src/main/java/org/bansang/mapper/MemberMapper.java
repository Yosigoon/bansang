package org.bansang.mapper;

import org.apache.ibatis.annotations.Insert;
import org.bansang.dto.MemberDTO;

public interface MemberMapper {

	@Insert("insert into tbl_member (member_id, member_pw, member_name, member_token) values (#{memberId}, #{memberPw}, #{memberName}, #{memberToken})")
	public void insert(MemberDTO dto);
	
	@Insert("insert into tbl_member (member_image) values (#{memberImage})")
	public void insertImage(MemberDTO dto);
}
