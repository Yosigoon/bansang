package org.bansang.web;
import org.bansang.dto.MemberDTO;
import org.bansang.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.java.Log;

@Controller
@RequestMapping("/*")
@Log
public class LoginController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/login")
	public void loginGet() {
		return;
	}
	
	@PostMapping("/login")
    public void loginPost(MemberDTO dto, Model model) {
        model.addAttribute("userSession", memberService.login(dto)); // jsp가 아닌  preHandler 쪽으로 보내기 위함
        return;
    }
}
