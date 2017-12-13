package org.bansang.mapper;


import org.apache.ibatis.annotations.Select;
import org.bansang.dto.GroupMemberDTO;
import org.bansang.dto.MemberDTO;

public interface MemberMapper {

	@Select("select * from tbl_member where member_id = #{memberId} and member_pw = #{memberPw} ")
	public MemberDTO login(MemberDTO dto);

	@Select("select * from tbl_member where member_id = #{cookeValue}")
	public MemberDTO autoLogin(String cookeValue);

	@Select("select * from tbl_member where member_id = #{memberId}")
	public MemberDTO isUser(GroupMemberDTO dto);
	


}
