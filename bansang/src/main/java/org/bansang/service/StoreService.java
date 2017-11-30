package org.bansang.service;

import java.util.List;

import org.bansang.dto.RecommendDTO;


public interface StoreService {


	public List<RecommendDTO> list();
	
	public RecommendDTO view(Long storeNumber);

	public void register(RecommendDTO dto);

	public RecommendDTO getInfo(Long storeNum);
	

}
