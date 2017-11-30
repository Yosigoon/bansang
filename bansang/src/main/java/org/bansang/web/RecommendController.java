package org.bansang.web;

import java.util.List;

import org.bansang.dto.RecommendDTO;
import org.bansang.service.RecommendService;
import org.bansang.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.java.Log;

@CrossOrigin
@RestController
@RequestMapping("/recommend/*")
@Log
public class RecommendController {
	
	@Autowired
	private RecommendService recommendService;
	
	@Autowired
	private StoreService storeService;

	@GetMapping("/store/{storeNumber}")
	public RecommendDTO getInfo(@PathVariable("storeNumber") Long storeNumber) {
		
		return storeService.getInfo(storeNumber);
	}
	
	@GetMapping("/list/{storeNumber}")
	public List<RecommendDTO> getList(@PathVariable("storeNumber") Long storeNumber) {
		
		return recommendService.getList(storeNumber);
	}
}
