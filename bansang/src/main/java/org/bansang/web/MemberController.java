package org.bansang.web;

import org.bansang.dto.MemberDTO;
import org.bansang.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins="*", allowedHeaders="*")
@RequestMapping("/join/*")
@RestController
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@PostMapping("/new")
	public void join(@RequestBody MemberDTO dto) {
		
		memberService.register(dto);
	}
	
	@PostMapping("/image")
	public void uploadImage(@RequestBody MemberDTO dto) {
		
		memberService.registerImage(dto);
	}
}
