package org.bansang.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.bansang.dto.RecommendDTO;

import java.util.List;

public interface StoreMapper {
	
	@Insert("insert into tbl_store (store_name, store_address, latitude, longitude, area_keyword) values (#{storeName}, #{storeAddress}, #{latitude}, #{longitude}, #{areaKeyword} )")
    public void register(RecommendDTO dto);

	@Select("select * from tbl_store")
	public List<RecommendDTO> listPage();
	
	@Select("select * from tbl_store where store_number = #{storeNumber}")
	public RecommendDTO view(Long storeNumber);


	@Select("select * from tbl_store where store_name = #{storeName}  and latitude = #{latitude} and longitude = #{longitude} ")
	public RecommendDTO exist(RecommendDTO dto);

	@Select("select * from tbl_store where store_number = #{storeNumber}")
    public RecommendDTO selectInfo(Long storeNumber);
	
}





