package org.bansang.service;

import java.util.List;

import org.bansang.dto.MemberAreaDTO;
import org.bansang.dto.MemberDTO;
import org.bansang.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.java.Log;

@Service
@Transactional
@Log
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

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

	@Override
	public MemberDTO getLoginInfo(MemberDTO dto) {
	
		return memberMapper.selectLoginInfo(dto);
	}	
}
