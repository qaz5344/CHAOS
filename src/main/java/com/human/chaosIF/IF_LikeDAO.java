package com.human.chaosIF;

import java.util.List;

import com.human.chaosDTO.LikeDTO;

public interface IF_LikeDAO {
	
	// insert
	
	// select
	public void insertLike(LikeDTO nDTO)throws Exception;
	public List<LikeDTO> AllLike(String id)throws Exception;
	public int likechk(LikeDTO n)throws Exception;
	public void deleteLike(LikeDTO n)throws Exception;
	
	// delete
}
