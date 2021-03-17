package com.human.chaos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.chaosDTO.NewsDTO;
import com.human.chaosDTO.ReviewDTO;
import com.human.service.IF_ChaosService;

@Controller
public class RevController {
	
	@Resource(name = "IF_ChaosService")
	private IF_ChaosService ChaS;

	@RequestMapping(value = "addR", method = RequestMethod.GET) //댓글쓰기
	public String addR(ReviewDTO n, Model model, HttpServletRequest no) throws Exception {
		ChaS.InsertRev(n);

		HttpSession session = no.getSession();
		String nowMem = (String) session.getAttribute("Nick");
		model.addAttribute("mDTO", ChaS.selEmail(nowMem));

		int cno = n.getNo();
		List<ReviewDTO> rList = ChaS.selectAll(cno);
		if (rList.size() > 0) {
			model.addAttribute("rList", rList);
		}
		model.addAttribute("nview", ChaS.selectOne(cno));
		return "View";
	}


	@RequestMapping(value = "inserRr", method = { RequestMethod.GET, RequestMethod.POST }) //대댓글입력
	@ResponseBody
	public Map<Object, Object> inserRr(@ModelAttribute("ReviewDTO") ReviewDTO rDTO)  throws Exception{
		rDTO.setStatus(1);
		Map<Object, Object> map = new HashMap<Object, Object>();
		ChaS.InsertRevr(rDTO);
		map.put("rrList", ChaS.selectAllR(rDTO.getNo()));

		return map;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" }) // 댓글 불러오기
	@RequestMapping(value = "commentList.do", produces = "application/json; charset=UTF8")
	@ResponseBody
	public ResponseEntity ajax_commentList(@ModelAttribute("ReviewDTO") ReviewDTO rDTO, HttpServletRequest request)
			throws Exception {
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();

		// 해당 게시물 댓글
		List<ReviewDTO> commentVO = ChaS.selectAll(rDTO.getNo());
		if (commentVO.size() > 0) {
			for (int i = 0; i < commentVO.size(); i++) {
				HashMap hm = new HashMap();
				hm.put("rnum", commentVO.get(i).getRnum());
				hm.put("comment", commentVO.get(i).getContent());
				hm.put("writer", commentVO.get(i).getNick());
				hm.put("status", commentVO.get(i).getStatus());
				hm.put("rgroup", commentVO.get(i).getRgroup());
				hm.put("pname", commentVO.get(i).getPname());
				
				hmlist.add(hm);
			}
		}
		JSONArray json = new JSONArray(hmlist);
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" }) // 댓글 불러오기
	@RequestMapping(value = "commentLists.do", produces = "application/json; charset=UTF8")
	@ResponseBody
	public ResponseEntity ajax_commentLists(@ModelAttribute("ReviewDTO") ReviewDTO rDTO, HttpServletRequest request)
			throws Exception {
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();

		// 해당 게시물 댓글
		List<ReviewDTO> commentVO = ChaS.selectAllR(rDTO.getNo());
		if (commentVO.size() > 0) {
			for (int i = 0; i < commentVO.size(); i++) {
				HashMap hm = new HashMap();
				hm.put("comment", commentVO.get(i).getContent());
				hm.put("writer", commentVO.get(i).getNick());
				hm.put("rgroup", commentVO.get(i).getRgroup());
				hm.put("rnum", commentVO.get(i).getRnum());
				hm.put("pname", commentVO.get(i).getPname());

				hmlist.add(hm);
			}
		}
		JSONArray json = new JSONArray(hmlist);
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}

	@RequestMapping(value = "addComment.do") // 댓글입력하기
	@ResponseBody
	public String ajax_addComment(@ModelAttribute("ReviewDTO") ReviewDTO rDTO, HttpServletRequest request)
			throws Exception {
		try {
			ChaS.InsertRev(rDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	@RequestMapping(value = "addRComment.do") // 대댓글입력하기
	@ResponseBody
	public String ajax_addRComment(@ModelAttribute("ReviewDTO") ReviewDTO rDTO, HttpServletRequest request)
			throws Exception {
		rDTO.setStatus(1);	
		try {
			ChaS.InsertRevr(rDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	@RequestMapping(value = "delReview", method = { RequestMethod.GET, RequestMethod.POST }) //댓글삭제 (대댓글도같이삭제)
	   @ResponseBody
	   public String delReview(@ModelAttribute("ReviewDTO") ReviewDTO rDTO) throws Exception {
	      ChaS.DeleteRev(rDTO.getRnum());
	      return "success";
	   }
	   
	   @RequestMapping(value = "delReviewr", method = { RequestMethod.GET, RequestMethod.POST }) //대댓글삭제
	   @ResponseBody
	   public String delReviewr(@ModelAttribute("ReviewDTO") ReviewDTO rDTO)  throws Exception{
	      ChaS.DeleteRevr(rDTO.getRnum());
	      System.out.println(rDTO.getRnum());
	     
	      return "success";
	   }
	   @RequestMapping(value = "modReview", method = { RequestMethod.GET, RequestMethod.POST }) //댓글삭제 (대댓글도같이삭제)
	   @ResponseBody
	   public String modReview(@ModelAttribute("ReviewDTO") ReviewDTO rDTO)  throws Exception{
	      ChaS.UpdateRev(rDTO);
	      return "success";
	   }
}
