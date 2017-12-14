package org.bansang.service;

import java.util.List;

import org.bansang.dto.Criteria;
import org.bansang.dto.RecommendDTO;
import org.bansang.dto.SearchCriteria;

public interface BansangService {

	public List<RecommendDTO> list(SearchCriteria cri);

	public RecommendDTO getModify(Long storeNumber);

	public void delete(RecommendDTO dto);

	public void sotoreModifyFileUpload(String imageNmae);
	
	/* public void modify(RecommendDTO dto); */

}
