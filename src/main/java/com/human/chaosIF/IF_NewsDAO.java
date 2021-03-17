package com.human.chaosIF;

import java.util.List;

import com.human.chaosDTO.NewsDTO;

public interface IF_NewsDAO {
	
	// insert
	// select
	public int insertNews(NewsDTO nDTO)throws Exception;
	public List selectAllN()throws Exception;
	public NewsDTO selectOne(int no)throws Exception;
	public int selectNo()throws Exception;
	public List<NewsDTO> selectNick(String Nick)throws Exception;
	public void updateNews(NewsDTO nDTO)throws Exception;
	public void deleteNews(int no)throws Exception;
	
	public int likecnt(int no)throws Exception;
	public void likeplus(int no)throws Exception;
	public void likeminus(int no)throws Exception;
	
	// update
	// delete
}
