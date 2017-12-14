package org.bansang.service;

import java.util.List;

import org.bansang.dto.Criteria;
import org.bansang.dto.RecommendDTO;
import org.bansang.dto.SearchCriteria;
import org.bansang.mapper.BansangMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.java.Log;

@Service
@Log
public class BansangServiceImpl implements BansangService {

	@Autowired
	BansangMapper bansangMapper;

	@Override
	public List<RecommendDTO> list(SearchCriteria cri) {
		cri.setTotal(bansangMapper.getTotal(cri));
		return bansangMapper.listPage(cri);
	}

	@Override
	public RecommendDTO getModify(Long storeNumber) {
		return bansangMapper.getModify(storeNumber);
	}

	@Override
	public void delete(RecommendDTO dto) {
		bansangMapper.delete(dto);
		return;
	}

	@Override
	public void sotoreModifyFileUpload(String imageNmae) {
		bansangMapper.storeModifyFileUpload(imageNmae);
		return;
	}

/*	@Override
	public void modify(RecommendDTO dto) {
		bansangMapper.modify(dto);
		return;
	}*/
}
