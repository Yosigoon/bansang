package org.bansang.web;

import org.bansang.dto.RecommendDTO;
import org.bansang.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import lombok.extern.java.Log;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@CrossOrigin
@RestController
@RequestMapping("/store/*")
@Log
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	
	@GetMapping("/list")
    public List<RecommendDTO> list(){
		return storeService.list();
    }
	
	@GetMapping("/view")
	public RecommendDTO getView(Long storeNumber) {
		return storeService.view(storeNumber);
	}
	
	@PostMapping("/recommend")
	public void addValue(@RequestBody RecommendDTO dto){
		storeService.register(dto);
	}
	
	@GetMapping("/{storeNum}")
	public RecommendDTO getRecommendList(@RequestParam("storeNum") Long storeNum) {
	 		
	 	return storeService.getInfo(storeNum);
	}

}
