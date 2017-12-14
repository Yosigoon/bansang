package org.bansang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.bansang.dto.MemberAreaDTO;
import org.bansang.dto.MemberDTO;

public interface MemberMapper {

	@Insert("insert into tbl_member (member_id, member_password, member_name, member_token) values (#{memberId}, #{memberPassword}, #{memberName}, #{memberToken})")
	public void insert(MemberDTO dto);
	
	@Insert("insert into tbl_area values (#{memberId}, #{area})")
	public void insertArea(MemberAreaDTO dto);
	
	@Update("update tbl_member set member_image = #{memberImage} where member_id = #{memberId}")
	public void insertImage(@Param("memberImage")String memberImage, @Param("memberId")String memberId);

	@Select("select * from tbl_member where member_id = #{memberId}")
	public MemberDTO selectInfo(MemberDTO dto);

	@Select("select area from tbl_area where member_id = #{memberId}")
	public List<MemberAreaDTO> selectArea(MemberDTO dto);
}
