package org.bansang.mapper;

import org.apache.ibatis.annotations.Insert;
import org.bansang.dto.GroupDTO;
import org.bansang.dto.GroupMemberDTO;

public interface GroupMapper {

	@Insert ("insert into tbl_groupmember (member_name, member_email) values (#{memberName}, #{memberEmail})")
	public void insertMember(GroupMemberDTO dto);

/*	@Insert ("insert into tbl_group (gname) values #{gname}")
	public void insertGroup(GroupDTO groupDTO);
*/
}
