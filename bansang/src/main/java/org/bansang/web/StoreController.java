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
		log.info("================");
		log.info(""+storeService.list());
		log.info("================");
		return storeService.list();
    }
	
	@GetMapping("/view")
	public RecommendDTO getView(Long storeNumber) {
		log.info("================");
		log.info(""+storeService.view(storeNumber));
		log.info("================");
		return storeService.view(storeNumber);
	}
	
	@PostMapping("/recommend")
	public void addValue(@RequestBody RecommendDTO dto){
		log.info("================");
		log.info("" + dto);
		log.info("================");
		
		storeService.register(dto);
	}
	
	@GetMapping("/{storeNum}")
	public RecommendDTO getRecommendList(@RequestParam("storeNum") Long storeNum) {
	 		
	 	return storeService.getInfo(storeNum);
	}

}
