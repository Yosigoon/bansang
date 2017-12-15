package org.bansang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.bansang.dto.GroupDTO;
import org.bansang.dto.GroupMemberDTO;

public interface GroupMapper {

	@Select("select temp.group_number, member_id, group_name, group_leader, group_member_count, register_date from \r\n" + 
			"(select group_number, member_id from tbl_group_member where member_id = 'sh@bitcamp.com') temp\r\n" + 
			"left join tbl_group\r\n" + 
			"on tbl_group.group_number = temp.group_number")
	public List<GroupDTO> groupList(String memberId);
	
	@Select("select * from tbl_group_member where group_number = #{groupNumber}")
	public List<GroupMemberDTO> groupMemberList(Long groupNumber);

	
	@Insert("insert into tbl_group (group_name, group_leader, group_member_count) values (#{groupName}, #{groupLeader}, #{groupMemberCount})")
	public void groupRegister(GroupDTO dto);

	public void groupMemberRegister(List<GroupMemberDTO> list);

	@Update("call group_member_update(LAST_INSERT_ID())")
	public void groupMembershipUpdate();
}
