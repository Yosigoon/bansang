package org.bansang.service;

import org.bansang.dto.MemberDTO;

public interface MemberService {

	public void register(MemberDTO dto);

	public void registerImage(MemberDTO dto);

}
