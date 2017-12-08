package org.bansang.web;

import org.bansang.dto.Criteria;
import org.bansang.dto.RecommendDTO;
import org.bansang.dto.SearchCriteria;
import org.bansang.service.BansangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/bansang/*")
@Log
public class BansangController {

	@Autowired
	BansangService bansangService;

	@GetMapping("/profile")
	public void getProfile() {
		return;
	}

	@GetMapping("/group")
	public void getGroup() {
		return;
	}

	@GetMapping("/storeManagement")
	public void getlist(Model model, @ModelAttribute("cri") SearchCriteria cri) {
		model.addAttribute("list", bansangService.list(cri));
		return;
	}

	@GetMapping("/storeModify")
	public void GetModify(Model model, Long storeNumber, @ModelAttribute("cri") SearchCriteria cri) {
		model.addAttribute("info", bansangService.getModify(storeNumber));
		return;
	}
	
	@PostMapping("/remove")
	public String remove(RecommendDTO dto, RedirectAttributes rttr) {
		bansangService.delete(dto);
		rttr.addFlashAttribute("result", "delsuccess");
		return "redirect:/bansang/storeManagement";
	}

	/*
	 * @PostMapping("/storeModify") public String modify(RecommendDTO dto,
	 * RedirectAttributes rttr) { rttr.addAttribute("storeNumber",
	 * dto.getStoreNumber()); // url에 표시 bansangService.modify(dto);
	 * rttr.addFlashAttribute("result", "modsuccess"); return
	 * "redirect:/bansang/sotreManagement"; }
	 */
}
