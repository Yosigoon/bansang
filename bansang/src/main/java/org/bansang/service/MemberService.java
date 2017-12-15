package org.bansang.service;

import java.util.Date;

import org.bansang.dto.MemberDTO;

public interface MemberService {

	public MemberDTO login(MemberDTO dto);

	public MemberDTO autoLogin(String cookeValue);

	public void keepLogin(String memberId, String sessionKey, Date sessionLimit);

	public void updateAutoLimit(String sessionKey, Date sessionLimit);

}
