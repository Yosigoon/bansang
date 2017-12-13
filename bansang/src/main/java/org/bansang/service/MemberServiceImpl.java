package org.bansang.service;

import org.bansang.dto.MemberDTO;
import org.bansang.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void register(MemberDTO dto) {

		memberMapper.insert(dto);
	}

	@Override
	public void registerImage(MemberDTO dto) {
		
		memberMapper.insertImage(dto);
	}
}
