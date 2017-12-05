package org.bansang.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/bansang/*")
@Log
public class BansangController {

	@GetMapping("/profile")
	public void getProfile() {
		return;
	}
	
	@GetMapping("/group")
	public void getGroup() {
		return;
	}
	
	@GetMapping("/storeManagement")
	public void getStore() {
		return;
	}
}
