package org.bansang.service;

import org.bansang.dto.MemberAreaDTO;
import org.bansang.dto.MemberDTO;
import org.bansang.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void register(MemberDTO memberDto) {

		memberMapper.insert(memberDto);
		
		String[] areas = memberDto.getAreas();
		
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
}
