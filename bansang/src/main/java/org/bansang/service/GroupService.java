package org.bansang.service;

import java.util.List;

import org.bansang.dto.GroupDTO;
import org.bansang.dto.GroupMemberDTO;

public interface GroupService {

	public void upload(GroupMemberDTO groupMemberDTO);

	public List<GroupDTO> groupList();
	
	public List<GroupMemberDTO> groupMemberList(Long groupNumber);
}
