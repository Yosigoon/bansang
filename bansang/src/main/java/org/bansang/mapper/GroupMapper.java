package org.bansang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.bansang.dto.GroupDTO;
import org.bansang.dto.GroupMemberDTO;

public interface GroupMapper {

	@Select("select * from tbl_group")
	public List<GroupDTO> groupList();
	
	@Select("select * from tbl_group_member where group_number = #{groupNumber}")
	public List<GroupMemberDTO> groupMemberList(Long groupNumber);

	
	@Insert("insert into tbl_group (group_name, group_leader, group_member_count) values (#{groupName}, #{groupLeader}, #{groupMemberCount})")
	public void GroupRegister(GroupDTO dto);

	public void GroupMemberRegister(List<GroupMemberDTO> list);
}
