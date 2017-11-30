package org.bansang.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.bansang.dto.RecommendDTO;

public interface RecommendMapper {
	

	@Insert("insert into tbl_recommend (store_number, recommend_contents, member_id) values (LAST_INSERT_ID(), #{recommendContents}, #{memberId} )")
    public void firstRegister(RecommendDTO dto);

	@Insert("insert into tbl_recommend (store_number, recommend_contents, member_id) values (#{storeNumber}, #{recommendContents}, #{memberId} )")
	public void plusRegister(RecommendDTO recommendDto);

	@Select("select * from tbl_recommend where store_number = #{storeNumber}")
	public List<RecommendDTO> selectList(Long storeNumber);
}