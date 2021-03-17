package com.human.chaos;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.human.chaosDTO.FileDTO;
import com.human.chaosDTO.MemberDTO;
import com.human.chaosDTO.NewsDTO;
import com.human.service.IF_ChaosService;
import com.human.service.MailSendService;
import com.human.util.FileDataUtil;

@Controller
public class MemController {
	@Inject
	private MailSendService mss;
	@Inject
	private IF_ChaosService ChaS;
	@Inject
	private FileDataUtil filedataUtil;
	// 로그인 버튼 클릭 시 호출 (멤버 로그인)
	@RequestMapping(value = "login_go", method = { RequestMethod.GET, RequestMethod.POST })
	public String login_go(MemberDTO M, HttpServletRequest request) throws Exception {
		MemberDTO mm = ChaS.Login(M);
		if (mm != null) { // 가입된 사람 (id와 pw가 일치하는 사람을 찾은 것)
			// 세션등록
			HttpSession session = request.getSession();
			session.setAttribute("Nick", mm.getNick());
			session.setAttribute("Id", mm.getId());
			session.setAttribute("Email", mm.getEmail());
			return "redirect:chaos";
		} else {
			return "Login/Login";
		}
	}

	@RequestMapping(value = "login", method = RequestMethod.GET) // 로그인
	public String Login(MemberDTO mem, HttpServletRequest h) {
		return "Login/Login";
	}

	// 멤버 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String viewloginForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();// 모든 세션, 현재 쿠키값으로 설정되어있는
		return "redirect:chaos";
	}

	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String signup(@ModelAttribute MemberDTO M) throws Exception {
		// 임의의 authKey 생성 & 이메일 발송
		String authKey = mss.sendAuthMail(M.getEmail());
		M.setAuthKey(authKey);
		// DB에 정보 등록
		ChaS.InsertMem(M);

		return "Login/Login";
	}

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String Join(Locale locale, Model model) {
		return "Login/Join";
	}

	@RequestMapping("sucess") // 이메일 인증완료
	public String sucess(HttpServletRequest request) throws Exception {
		MemberDTO m = new MemberDTO();
		m.setEmail(request.getParameter("email"));
		m.setAuthKey(request.getParameter("authKey"));
		ChaS.UpdateAuth(m);
		return "Login/sucess";
	}

	@RequestMapping("email") // 이메일 인증하러가자
	public String email(HttpServletRequest request, Model model) {
		model.addAttribute("email", request.getParameter("email"));
		return "Login/Email";
	}

	// 닉네임 변경 페이지
	@RequestMapping(value = "modmynick", method = RequestMethod.GET)
	public String modmynick(Model model, HttpServletRequest request) {
		return "mypage/modmynick";
	}

	// 닉네임 변경
	@RequestMapping(value = "modnick", method = RequestMethod.GET)
	public String modnick(@ModelAttribute MemberDTO M, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		session = request.getSession();
		session.setAttribute("Nick", M.getNick());
		session.setAttribute("Id", M.getId());
		session.setAttribute("Email", M.getEmail());
		ChaS.modnick(M);
		return "redirect:mypage";
	}

	// 프로필사진 변경 페이지
	@RequestMapping(value = "modmyPP", method = RequestMethod.GET)
	public String modmyPP(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String nowMem = (String) session.getAttribute("Nick");
		model.addAttribute("mDTO", ChaS.selEmail(nowMem));
		
		return "mypage/modmyPP";
	}
	// 프로필사진 변경
	@RequestMapping(value = "updatePP", method = RequestMethod.POST)
	public String updatePP(MultipartFile file,HttpServletRequest request) throws Exception {
		String delName = request.getParameter("pname");
		HttpSession session = request.getSession();
		String nowMem = (String) session.getAttribute("Nick");
		MemberDTO mDTO = new MemberDTO();
		
		if(file.getOriginalFilename()=="") {
			System.out.println("첨부파일없음");
		}else {
			File target = new File(filedataUtil.getUploadPath(),delName);
			if(target.exists()) {
				target.delete();
			}
			String[] files = filedataUtil.fileUpload(file);
			mDTO.setPname(files[0]);
			mDTO.setNick(nowMem);
			System.out.println(files[0]);
			ChaS.modpp(mDTO);
		}
		
		return "redirect:mypage";
	}

	// 비밀번호 변경 페이지
	@RequestMapping(value = "modmypw", method = RequestMethod.GET)
	public String modmypw(Model model, HttpServletRequest request) {
		return "mypage/modmypw";
	}

	// pwck 체크
	@RequestMapping(value = "pwck", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<Object, Object> pwck(@ModelAttribute("MemberDTO") MemberDTO mDTO) throws Exception {
		Map<Object, Object> map = new HashMap<Object, Object>();
		String cpw = ChaS.FindPW(mDTO);
		if (cpw.equals(mDTO.getPw())) {
			map.put("cnt", 1);
		} else {
			map.put("cnt", 0);
		}
		return map;
	}

	// 마이페이지
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String nowMem = (String) session.getAttribute("Nick");
		model.addAttribute("mDTO", ChaS.selEmail(nowMem));

		List<NewsDTO> nList = ChaS.selectNick(nowMem);

		if (nList.size() > 0) {
			model.addAttribute("nList", nList);
			model.addAttribute("files", ChaS.seFileUser(nowMem));
		}
		return "mypage/mypage";
	}

	// 비밀번호 변경
	@RequestMapping(value = "modpw", method = RequestMethod.GET)
	public String modpw(@ModelAttribute MemberDTO M) throws Exception {
		ChaS.modpw(M);
		return "redirect:logout";
	}

}
