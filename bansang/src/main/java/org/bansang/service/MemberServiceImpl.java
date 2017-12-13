package org.bansang.service;

import javax.inject.Inject;

import org.bansang.dto.MemberDTO;
import org.bansang.mapper.MemberMapper;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	private MemberMapper memberMapper;
	
	@Override
	public MemberDTO login(MemberDTO dto) {
		
		return memberMapper.login(dto);
	}

	@Override
	public MemberDTO autoLogin(String cookeValue) {
		
		return memberMapper.autoLogin(cookeValue);
	}

}
