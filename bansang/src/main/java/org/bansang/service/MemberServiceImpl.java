package org.bansang.service;

import java.util.Date;

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

	@Override
	public void keepLogin(String memberId, String sessionKey, Date sessionLimit) {
		memberMapper.keepLogin(memberId, sessionKey, sessionLimit);
		return;
	}

	@Override
	public void updateAutoLimit(String sessionKey, Date sessionLimit) {
		memberMapper.updateAutoLimit(sessionKey, sessionLimit);
		
	}

}
