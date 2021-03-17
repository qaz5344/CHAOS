package com.human.chaos;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.chaosDTO.MemberDTO;
import com.human.chaosDTO.NewsDTO;
import com.human.chaosDTO.ReviewDTO;
import com.human.service.IF_ChaosService;
import com.human.service.MailSendService;

@Controller
public class FindController {
	@Inject
	private MailSendService mss;
	@Inject
	private IF_ChaosService ChaS;

	@RequestMapping(value = "help", method = RequestMethod.GET)
	public String Help(Locale locale, Model model) {
		return "Login/Help";
	}

	// 회원체크
	@RequestMapping(value = "idcheck", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String userdata)  throws Exception{
		String[] split = userdata.split("&");
		String id = split[0].substring(split[0].indexOf("=") + 1);
		String pw = split[1].substring(split[1].indexOf("=") + 1);
		MemberDTO MM = new MemberDTO();
		MM.setId(id);
		MM.setPw(pw);

		Map<Object, Object> map = new HashMap<Object, Object>();

		map.put("user", ChaS.Login(MM));
		return map;
	}

	// id체크
	@RequestMapping(value = "idck", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<Object, Object> idck(@RequestBody String userid) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();

		if (userid.length() > 20) {
			map.put("cnt", 3);
		} else if (userid.length() < 2) {
			map.put("cnt", 4);
		} else {
			map.put("cnt", ChaS.selId(userid));
		}
		return map;
	}

	// Nick 체크
	@RequestMapping(value = "nick", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<Object, Object> nick(@RequestBody String uni) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();
		if (uni.length() > 10) {
			map.put("cnt", 3);
		} else if (uni.length() < 2) {
			map.put("cnt", 4);
		} else {
			map.put("cnt", ChaS.selNi(uni));

		}
		return map;
	}

	@RequestMapping(value = "sendE_PW", method = { RequestMethod.GET, RequestMethod.POST }) // 비밀번호찾기 인증 이메일 보내기
	@ResponseBody
	public Map<Object, Object> sendE_PW(@ModelAttribute("MemberDTO") MemberDTO mDTO) throws Exception {
		int h = ChaS.Mchk(mDTO);
		String authKey = "";
		if (h == 1) {
			authKey = "ss";
		}
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("authKey", authKey);
		return map;
	}
	
	@RequestMapping(value = "sendE_PWs", method = { RequestMethod.GET, RequestMethod.POST }) // 비밀번호찾기 인증 이메일 보내기
	@ResponseBody
	public Map<Object, Object> sendE_PWs(@ModelAttribute("MemberDTO") MemberDTO mDTO) {
			String authKey = mss.sendAuthMail_FPW(mDTO.getEmail());
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("authKey", authKey);
		return map;
	}

	@RequestMapping(value = "Findpw", method = { RequestMethod.GET, RequestMethod.POST }) // 비밀번호찾기
	@ResponseBody
	public Map<Object, Object> Findpw(@ModelAttribute("MemberDTO") MemberDTO mDTO) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();
		System.out.println(mDTO.getId());
		System.out.println(mDTO.getEmail());
		String pw = ChaS.FindPW(mDTO);
		System.out.println(pw);
		
		map.put("FPW", ChaS.FindPW(mDTO));
		System.out.println(map.size());
		return map;
	}

	@RequestMapping(value = "findId", method = { RequestMethod.GET, RequestMethod.POST }) // ID 있는지 확인
	@ResponseBody
	public Map<Object, Object> findId(@RequestBody String email)  throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();

		List<MemberDTO> ss = ChaS.FindId(email);
		if (ss.size() > 0) {
			map.put("info", "있어");
		}
		return map;
	}
	@RequestMapping(value = "findIdsend", method = { RequestMethod.GET, RequestMethod.POST }) // ID 있는지 확인
	@ResponseBody
	public Map<Object, Object> findIdsend(@RequestBody String email) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("authKey", mss.sendAuthMail_FPW(email));
		
		return map;
	}

	@RequestMapping(value = "findId2", method = { RequestMethod.GET, RequestMethod.POST }) // 인증완료시 아이디 보내주기
	@ResponseBody	
	public List<MemberDTO> findId2(@RequestBody String email) throws Exception {
		List<MemberDTO> mList = ChaS.FindId2(email);
		return mList;
	}

	@RequestMapping(value = "hhelp", method = RequestMethod.GET)
	public String hhelp(Locale locale, Model model) {
		return "Login/IdHelp";
	}
	
	@RequestMapping("sendE") // 인증 이메일 보내기
	public String sendE(MemberDTO mDTO)  throws Exception{
		String authKey = mss.sendAuthMail(mDTO.getEmail());
		mDTO.setAuthKey(authKey);
		ChaS.UpdateEmail(mDTO);
		return "redirect:chaos";
	}
}
