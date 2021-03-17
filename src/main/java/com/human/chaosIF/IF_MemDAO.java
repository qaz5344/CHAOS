package com.human.chaosIF;

import java.util.List;

import com.human.chaosDTO.MemberDTO;

public interface IF_MemDAO {
	
	// insert
	public void InsertMem(MemberDTO newM)throws Exception;
	
	// select
	public MemberDTO Login(MemberDTO M)throws Exception;
	public MemberDTO selEmail(String Nick)throws Exception;
	public int selId(String id)throws Exception;
	public int selNi(String Ni)throws Exception;
	public String FindPW(MemberDTO M)throws Exception;
	public int Mchk(MemberDTO M)throws Exception;
	public List<MemberDTO> FindId(String Email)throws Exception;
	public List<MemberDTO> FindId2(String Email)throws Exception;
	
	// update
	public void UpdateAuth(MemberDTO M)throws Exception; //이메일 인증상태 업데이트
	public void UpdateEmail(MemberDTO M)throws Exception; //이메일,key 업데이트
	public void modnick(MemberDTO M)throws Exception; 	//닉네임 변경
	public void modpw(MemberDTO M)throws Exception; 	//비밀번호 변경
	public void modpp(MemberDTO M)throws Exception; 	//프로필사진 변경
	
}
