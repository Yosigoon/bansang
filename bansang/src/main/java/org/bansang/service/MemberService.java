package org.bansang.service;

import java.util.List;

import org.bansang.dto.MemberAreaDTO;
import org.bansang.dto.MemberDTO;
import org.springframework.http.ResponseEntity;

public interface MemberService {

	public void register(MemberDTO dto);

	public void registerImage(String memberImage, String memberId);

	public MemberDTO getInfo(MemberDTO dto);

	public List<MemberAreaDTO> getArea(MemberDTO dto);
	
	public MemberDTO getLoginInfo(MemberDTO dto);

}
