package org.bansang.service;

import org.bansang.dto.MemberDTO;

public interface MemberService {

	public MemberDTO login(MemberDTO dto);

	public MemberDTO autoLogin(String cookeValue);

}
