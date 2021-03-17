package com.human.service;

import java.util.List;

import com.human.chaosDTO.FileDTO;
import com.human.chaosDTO.LikeDTO;
import com.human.chaosDTO.MemberDTO;
import com.human.chaosDTO.NewsDTO;
import com.human.chaosDTO.ReviewDTO;

public interface IF_ChaosService {
	// member
	public void InsertMem(MemberDTO newM)throws Exception;
	public MemberDTO Login(MemberDTO M)throws Exception;
	public MemberDTO selEmail(String Nick)throws Exception;
	public int selId(String id)throws Exception;
	public int selNi(String Ni)throws Exception;
	public String FindPW(MemberDTO M)throws Exception;
	public int Mchk(MemberDTO M)throws Exception;
	public List<MemberDTO> FindId(String Email)throws Exception;
	public List<MemberDTO> FindId2(String Email)throws Exception;
	public void UpdateAuth(MemberDTO M)throws Exception; //이메일 인증상태 업데이트
	public void UpdateEmail(MemberDTO M)throws Exception; //이메일,key 업데이트
	public void modnick(MemberDTO M)throws Exception; 	//닉네임 변경
	public void modpw(MemberDTO M)throws Exception; 	//비밀번호 변경
	public void modpp(MemberDTO M)throws Exception; 	//프로필사진 변경
	// news
	public int insertNews(NewsDTO nDTO)throws Exception;
	public List selectAllN()throws Exception;
	public NewsDTO selectOne(int no)throws Exception;
	public int selectNo()throws Exception;
	public List<NewsDTO> selectNick(String Nick)throws Exception;
	public void updateNews(NewsDTO nDTO)throws Exception;
	public void deleteNews(int no)throws Exception;
	
	// review
	public void InsertRev(ReviewDTO newR)throws Exception;
	public void InsertRevr(ReviewDTO newR)throws Exception;
	public List<ReviewDTO> selectAll(int no)throws Exception;
	public List<ReviewDTO> selectAllR(int no)throws Exception;
	public void UpdateRev(ReviewDTO R)throws Exception;
	
	public void DeleteRev(int num)throws Exception;
	public void DeleteRevr(int num)throws Exception;
	
	// like
	public void insertLike(LikeDTO nDTO)throws Exception;
	public List<LikeDTO> AllLike(String id)throws Exception;
	public int likechk(LikeDTO n)throws Exception;
	public void deleteLike(LikeDTO n)throws Exception;
	
	public int likecnt(int no)throws Exception;
	public void likeplus(int no)throws Exception;
	public void likeminus(int no)throws Exception;
	
	//File
	public List<FileDTO> seFile()throws Exception;
	public List<FileDTO> seFiles(int no)throws Exception;
	public List<FileDTO> seFileUser(String nick)throws Exception;
	public void insertF(FileDTO fDTO)throws Exception;
	public void delBnum(int bnum)throws Exception;
}
