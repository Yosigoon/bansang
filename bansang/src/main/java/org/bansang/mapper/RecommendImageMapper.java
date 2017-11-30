package org.bansang.mapper;

import org.apache.ibatis.annotations.Insert;

public interface RecommendImageMapper {

	@Insert("insert into table_recommend_image (imageName, recommendNumber) values (#{imageName}, LAST_INSERT_ID())")
	public void insert(String imageName);
	
	
}
