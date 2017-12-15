package org.bansang.mapper;


import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.bansang.dto.GroupMemberDTO;
import org.bansang.dto.MemberDTO;

public interface MemberMapper {

	@Select("select * from tbl_member where member_id = #{memberId} and member_password = #{memberPassword} ")
	public MemberDTO login(MemberDTO dto);

	@Select("select * from tbl_member where session_key = #{cookeValue} and session_limit > now()")
	public MemberDTO autoLogin(String cookeValue);

	@Select("select * from tbl_member where member_id = #{memberId}")
	public MemberDTO isUser(GroupMemberDTO dto);

	@Update("update tbl_member set session_key = #{sessionKey}, session_limit = #{sessionLimit} where member_id = #{memberId}")
	public void keepLogin(@Param("memberId") String memberId, @Param("sessionKey") String sessionKey, @Param("sessionLimit") Date sessionLimit);

	@Update("update tbl_member set session_limit = #{sessionLimit} where session_key = #{sessionKey}")
	public void updateAutoLimit(@Param("sessionKey") String sessionKey,@Param("sessionLimit") Date sessionLimit);
	

}
