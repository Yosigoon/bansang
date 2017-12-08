package org.bansang.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.bansang.dto.RecommendDTO;

import java.util.List;

public interface StoreMapper {
	
	@Select("call store_first_register(#{storeName}, #{storeAddress}, #{latitude}, #{longitude}, #{areaKeyword})")
    public Long register(RecommendDTO dto);

	@Select("select * from tbl_store")
	public List<RecommendDTO> listPage();
	
	@Select("select * from tbl_store where store_number = #{storeNumber}")
	public RecommendDTO view(Long storeNumber);


	@Select("select * from tbl_store where store_name = #{storeName}  and latitude = #{latitude} and longitude = #{longitude} ")
	public RecommendDTO exist(RecommendDTO dto);

	@Select("select * from tbl_store where store_number = #{storeNumber}")
    public RecommendDTO selectInfo(Long storeNumber);

	@Insert("insert into tbl_store_image (image_name, store_number) values (#{uploadName}, #{storeNumber})")
	public void uploadStoreImage(@Param("uploadName") String uploadName, @Param("storeNumber") Long storeNumber);

	@Select("select image_name imageName from tbl_store_image where store_number = #{storeNumber}")
	public List<String> getImageList(Long storeNumber);
	
}





