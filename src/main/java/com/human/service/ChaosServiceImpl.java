package com.human.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.human.chaosDTO.FileDTO;
import com.human.chaosDTO.LikeDTO;
import com.human.chaosDTO.MemberDTO;
import com.human.chaosDTO.NewsDTO;
import com.human.chaosDTO.ReviewDTO;
import com.human.chaosIF.IF_FileDAO;
import com.human.chaosIF.IF_LikeDAO;
import com.human.chaosIF.IF_MemDAO;
import com.human.chaosIF.IF_NewsDAO;
import com.human.chaosIF.IF_RevDAO;

@Service("IF_ChaosService")
public class ChaosServiceImpl implements IF_ChaosService {
	@Autowired
	private IF_MemDAO chaMem; // 회원관리
	@Autowired
	private IF_NewsDAO chaNew; // 글관리
	@Autowired
	private IF_RevDAO chaRev; // 댓글관리
	@Autowired
	private IF_LikeDAO chaLike; // 좋아요관리
	@Autowired
	private IF_FileDAO chaFile; // 좋아요관리

	// member -----------------------------------
	@Override
	@Transactional
	public void InsertMem(MemberDTO newM) throws Exception { // 회원등록
		chaMem.InsertMem(newM);
	}

	@Override
	@Transactional
	public MemberDTO Login(MemberDTO M) throws Exception { // 회원 로그인
		return chaMem.Login(M);
	}

	@Override
	@Transactional
	public void UpdateAuth(MemberDTO M) throws Exception { // 회원 최종승인
		chaMem.UpdateAuth(M);
	}

	@Override
	@Transactional
	public void UpdateEmail(MemberDTO M) throws Exception { // 회원 이메일,key 업데이트
		chaMem.UpdateEmail(M);
	}

	@Override
	@Transactional
	public MemberDTO selEmail(String Nick) throws Exception { // 이메일인증 확인
		return chaMem.selEmail(Nick);
	}

	@Override
	@Transactional
	public int selId(String id) throws Exception { // 좋아요
		return chaMem.selId(id);
	}

	@Override
	@Transactional
	public int selNi(String Ni) throws Exception {
		return chaMem.selNi(Ni);
	}

	@Override
	@Transactional
	public String FindPW(MemberDTO M) throws Exception { // 비밀번호 찾기
		return chaMem.FindPW(M);
	}

	@Override
	@Transactional
	public int Mchk(MemberDTO M) throws Exception { // 멤버 확인
		return chaMem.Mchk(M);
	}

	@Override
	@Transactional
	public List<MemberDTO> FindId(String Email) throws Exception {
		return chaMem.FindId(Email);
	}

	@Override
	@Transactional
	public List<MemberDTO> FindId2(String Email) throws Exception {
		return chaMem.FindId2(Email);
	}

	@Override
	@Transactional
	public void modnick(MemberDTO M) throws Exception { // 닉네임 변경
		chaMem.modnick(M);
	}

	@Override
	@Transactional
	public void modpw(MemberDTO M) throws Exception { // 닉네임 변경
		chaMem.modpw(M);
	}
	@Override
	@Transactional
	public void modpp(MemberDTO M) throws Exception { // 프로필사진 변경
		chaMem.modpp(M);
	}

	// news -------------------------------------
	@Override
	@Transactional
	public int insertNews(NewsDTO nDTO) throws Exception { // 글 등록
		chaNew.insertNews(nDTO);
		return chaNew.selectNo();
	}

	@Override
	@Transactional
	public List selectAllN() throws Exception { // 글 가져오기
		return chaNew.selectAllN();
	}

	@Override
	@Transactional
	public List<NewsDTO> selectNick(String Nick) throws Exception { // 글 가져오기
		return chaNew.selectNick(Nick);
	}

	@Override
	@Transactional
	public void updateNews(NewsDTO nDTO) throws Exception { // 글 수정하기
		chaNew.updateNews(nDTO);
	}

	@Override
	@Transactional
	public NewsDTO selectOne(int no) throws Exception { // 글 자세히보기 (댓글)
		return chaNew.selectOne(no);
	}

	@Override
	@Transactional
	public void deleteNews(int no) throws Exception { // 글 삭제하기
		chaNew.deleteNews(no);
	}

	@Override
	@Transactional
	public void likeplus(int no) throws Exception { // 글 좋아요 수 증가
		chaNew.likeplus(no);
	}

	@Override
	@Transactional
	public void likeminus(int no) throws Exception { // 글 좋아요 수 감소
		chaNew.likeminus(no);
	}

	@Override
	@Transactional
	public int likecnt(int no) throws Exception { // 좋아요 개수 확인
		return chaNew.likecnt(no);
	}

	// Review -----------------------------------
	@Override
	@Transactional
	public void InsertRev(ReviewDTO newR) throws Exception { // 댓글등록 하는 것
		chaRev.InsertRev(newR);
	}

	@Override
	@Transactional
	public void InsertRevr(ReviewDTO newR) throws Exception { // 대댓글등록 하는 것
		chaRev.InsertRevr(newR);
	}

	@Override
	@Transactional
	public List<ReviewDTO> selectAll(int no) throws Exception { // 해당글 댓글 가져오기
		return chaRev.selectAll(no);
	}

	@Override
	@Transactional
	public List<ReviewDTO> selectAllR(int no) throws Exception { // 해당글 대댓글 가져오기
		return chaRev.selectAllR(no);
	}

	@Override
	@Transactional
	public void UpdateRev(ReviewDTO R) throws Exception {// 댓글 수정하기
		chaRev.UpdateRev(R);
	}

	@Override
	@Transactional
	public void DeleteRev(int num) throws Exception {// 댓글삭제시 대댓글도 삭제
		chaRev.DeleteRev(num);
		chaRev.ReDeleteRev(num);
	}

	@Override
	@Transactional
	public void DeleteRevr(int num) throws Exception {// 대댓글 삭제
		chaRev.DeleteRevr(num);
	}

	// Like -----------------------------------
	@Override
	@Transactional
	public void insertLike(LikeDTO nDTO) throws Exception { // 게시글에 맞는 좋아요 튜플추가
		chaLike.insertLike(nDTO);
	}

	@Override
	@Transactional
	public List<LikeDTO> AllLike(String id) throws Exception { // 모든라이크 튜플 가져오기
		return chaLike.AllLike(id);
	}

	@Override
	@Transactional
	public int likechk(LikeDTO n) throws Exception { // 좋아요 있는지 여부확인
		return chaLike.likechk(n);
	}

	@Override
	@Transactional
	public void deleteLike(LikeDTO n) throws Exception { // 좋아요 취소 (삭제)
		chaLike.deleteLike(n);
	}

	// File --------------------------------------
	@Override
	@Transactional
	public void insertF(FileDTO fDTO) throws Exception {
		chaFile.insertF(fDTO);
	}

	@Override
	@Transactional
	public List<FileDTO> seFile() throws Exception {
		return chaFile.seFile();
	}

	@Override
	@Transactional
	public List<FileDTO> seFiles(int no) throws Exception {
		return chaFile.seFiles(no);
	}

	@Override
	@Transactional
	public List<FileDTO> seFileUser(String nick) throws Exception {
		return chaFile.seFileUser(nick);
	}

	@Override
	@Transactional
	public int selectNo() throws Exception {
		return chaNew.selectNo();
	}

	@Override
	@Transactional
	public void delBnum(int bnum) throws Exception {

	}
}
