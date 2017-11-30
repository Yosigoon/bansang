package org.bansang.service;

import org.bansang.dto.GroupMemberDTO;
import org.bansang.mapper.GroupMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupServiceImpl implements GroupService {
	
	@Autowired
	GroupMapper groupMapper;

	@Override
	public void upload(GroupMemberDTO groupMemberDTO) {

		groupMapper.insertMember(groupMemberDTO);
	}
}
