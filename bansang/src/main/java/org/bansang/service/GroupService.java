package org.bansang.service;

import java.util.List;

import org.bansang.dto.GroupDTO;
import org.bansang.dto.GroupMemberDTO;

public interface GroupService {

	public void upload(GroupDTO dto);

	public List<GroupDTO> groupList(String MemberId);
	
	public List<GroupMemberDTO> groupMemberList(Long groupNumber);
}
