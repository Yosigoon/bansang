package org.bansang.service;

import javax.inject.Inject;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.bansang.dto.RecommendDTO;
import org.bansang.mapper.RecommendMapper;
import org.bansang.mapper.StoreMapper;
import org.springframework.stereotype.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreMapper storeMapper;
	@Inject
	private RecommendMapper recommendMapper;
	
	@Override
	public List<RecommendDTO> list() {
		return storeMapper.listPage();
	}

	@Override
	public RecommendDTO view(Long storeNumber) {
		return storeMapper.view(storeNumber);
	}

	
	@Override
	public void register(RecommendDTO dto) {
		System.out.println("=====================");
		System.out.println(dto);
		System.out.println("=====================");
		RecommendDTO obj = storeMapper.exist(dto);
		if(obj == null) { 
			storeMapper.register(dto);
			recommendMapper.firstRegister(dto);
		}else { 
			dto.setStoreNumber(obj.getStoreNumber());
			recommendMapper.plusRegister(dto);
		}
		
	}

	@Override
	public RecommendDTO getInfo(Long storeNum) {
		
		return storeMapper.selectInfo(storeNum);
	}

}
