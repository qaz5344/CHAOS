package com.human.chaosIF;

import java.util.List;

import com.human.chaosDTO.ReviewDTO;

public interface IF_RevDAO {
	
	// insert
	// select
	
	// update
	public void InsertRev(ReviewDTO newR)throws Exception;
	public void InsertRevr(ReviewDTO newR)throws Exception;
	public List<ReviewDTO> selectAll(int no)throws Exception;
	public List<ReviewDTO> selectAllR(int no)throws Exception;
	public void UpdateRev(ReviewDTO R)throws Exception;
	
	public void DeleteRev(int num)throws Exception;
	public void ReDeleteRev(int num)throws Exception;
	public void DeleteRevr(int num)throws Exception;
	//delete
}
