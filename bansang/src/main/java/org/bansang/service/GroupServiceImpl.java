package org.bansang.service;

import java.util.List;

import org.bansang.dto.GroupDTO;
import org.bansang.dto.GroupMemberDTO;
import org.bansang.mapper.GroupMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupServiceImpl implements GroupService {
	
	@Autowired
	GroupMapper groupMapper;

	@Override
	public void upload(GroupDTO dto) {
		groupMapper.groupRegister(dto);
		groupMapper.groupMemberRegister(dto.getList());
		groupMapper.groupMembershipUpdate();
	}

	@Override
	public List<GroupDTO> groupList() {

		return groupMapper.groupList();
	}

	@Override
	public List<GroupMemberDTO> groupMemberList(Long groupNumber) {
		return groupMapper.groupMemberList(groupNumber);
	}
}
