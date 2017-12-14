package org.bansang.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.bansang.dto.MemberAreaDTO;
import org.bansang.dto.MemberDTO;

public interface MemberMapper {

	@Insert("insert into tbl_member (member_id, member_pw, member_name, member_token) values (#{memberId}, #{memberPw}, #{memberName}, #{memberToken})")
	public void insert(MemberDTO dto);
	
	@Insert("insert into tbl_area values (#{memberId}, #{area})")
	public void insertArea(MemberAreaDTO dto);
	
	@Update("update tbl_member set member_image = #{memberImage} where member_id = #{memberId}")
	public void insertImage(@Param("memberImage")String memberImage, @Param("memberId")String memberId);
}
