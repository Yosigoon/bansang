package org.bansang.service;


import java.util.Date;

import javax.inject.Inject;

import org.bansang.dto.MemberDTO;
import org.bansang.mapper.MemberMapper;
import org.springframework.stereotype.Service;
import java.util.List;

import org.bansang.dto.MemberAreaDTO;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.transaction.annotation.Transactional;

import lombok.extern.java.Log;
@Service
@Log
@Transactional
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

	@Override
	public void register(MemberDTO memberDto) {

		memberMapper.insert(memberDto);
		
		String[] areas = memberDto.getAreas();
		
		log.info("" + memberDto);
		
		for(int i = 0; i < areas.length; i++) {
			
			MemberAreaDTO memberAreaDto = new MemberAreaDTO();
			memberAreaDto.setMemberId(memberDto.getMemberId());
			memberAreaDto.setArea(areas[i]);
			
			memberMapper.insertArea(memberAreaDto);
		}
	}

	@Override
	public void registerImage(String memberImage, String memberId) {
		
		memberMapper.insertImage(memberImage, memberId);
	}

	@Override
	public MemberDTO getInfo(MemberDTO dto) {

		return memberMapper.selectInfo(dto);
	}

	@Override
	public List<MemberAreaDTO> getArea(MemberDTO dto) {

		return memberMapper.selectArea(dto);
	}
}
