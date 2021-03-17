package com.human.chaos;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.human.chaosDTO.FileDTO;
import com.human.chaosDTO.LikeDTO;
import com.human.chaosDTO.MemberDTO;
import com.human.chaosDTO.NewsDTO;
import com.human.chaosDTO.ReviewDTO;
import com.human.service.IF_ChaosService;
import com.human.util.FileDataUtil;

@Controller
public class ChaosController {
	
	@Resource(name = "IF_ChaosService")
	private IF_ChaosService ChaS;

	@Inject
	private FileDataUtil filedataUtil;
	
	@RequestMapping(value = "/chaos", method = RequestMethod.GET) // 메인화면 
	public String Chaos(Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String nowMem = (String) session.getAttribute("Nick");
		if(nowMem != null) {
			model.addAttribute("mDTO", ChaS.selEmail(nowMem));	
		}

		List nList = ChaS.selectAllN();
		if (nList.size() > 0) {
			model.addAttribute("nList", nList);
			model.addAttribute("files",ChaS.seFile());
		}
		return "Chaos";
	}

	@RequestMapping(value = "add", method = { RequestMethod.GET, RequestMethod.POST }) // 글쓰기
	public String add(NewsDTO n,HttpServletRequest request,MultipartHttpServletRequest mtf) throws Exception {
		String Fname = request.getParameter("Fname");
		FileDTO FDTO = new FileDTO();
		FDTO.setNo(ChaS.insertNews(n));
		if(Fname!=null) {
			FDTO.setFname(Fname);			
			ChaS.insertF(FDTO);
		}
		System.out.println(FDTO.getNo());
		List<MultipartFile> fileList = mtf.getFiles("file");
		for (MultipartFile mf : fileList) {
			if (mf.getOriginalFilename() != "") {
				String[] files = filedataUtil.fileUpload(mf);
				FileDTO bFD = new FileDTO();
				bFD.setFname(files[0]); // 원본 파일 명
				bFD.setNo(FDTO.getNo());
				bFD.setNick(n.getNick());
				//이제 인설트
				ChaS.insertF(bFD);
			}
		}
		return "redirect:chaos";
	}

	@RequestMapping(value = "view", method = RequestMethod.GET) //글 자세히보기?
	public String view(HttpServletRequest no, Model model) throws Exception {
		
		HttpSession session = no.getSession();
		String nowMem = (String) session.getAttribute("Nick");		
		MemberDTO mDTO = ChaS.selEmail(nowMem);		
		model.addAttribute("mDTO", mDTO);
		int cno = Integer.valueOf(no.getParameter("no"));
		List<ReviewDTO> rList = ChaS.selectAll(cno);
		List<ReviewDTO> rrList = ChaS.selectAllR(cno);
		if (rList.size() > 0) {
			model.addAttribute("rList", rList);
			model.addAttribute("rrList", rrList);
		}
		model.addAttribute("nview", ChaS.selectOne(cno));
		model.addAttribute("files",ChaS.seFile());
		return "View";
	}

	@RequestMapping(value="mod")
    @ResponseBody
    public String mod(@ModelAttribute("NewsDTO") NewsDTO nDTO, HttpServletRequest request) throws Exception{
        try{
           ChaS.updateNews(nDTO);
        } catch (Exception e){
            e.printStackTrace();
        }
        return nDTO.getNo()+"";
    }

	@RequestMapping(value = "del", method = RequestMethod.GET)
	public String del(MemberDTO mem, HttpServletRequest h,MultipartFile file)throws Exception {
		int cno = Integer.valueOf(h.getParameter("no"));
		List<FileDTO> fList = ChaS.seFiles(cno);
		for(int i=0; i<fList.size(); i++) {
			String delFname = fList.get(i).getFname();
			File target = new File(filedataUtil.getUploadPath(),delFname);
			if(target.exists()) {
				target.delete();
			}
		}
		ChaS.deleteNews(cno);		
		return "redirect:chaos";
	}

	// 좋아요 기능
	@RequestMapping(value = "liketo", method = { RequestMethod.GET, RequestMethod.POST }) // 좋아요
	@ResponseBody
	public Map<Object, Object> liketo(@RequestBody String like) throws Exception {
		String[] split = like.split("&");
		String id = split[0].substring(split[0].indexOf("=") + 1);
		String no = split[1].substring(split[1].indexOf("=") + 1);
		int nno = Integer.valueOf(no);

		LikeDTO nl = new LikeDTO();
		nl.setId(id);
		nl.setNo(nno);

		int chk = 0;
		chk = ChaS.likechk(nl);
		if (chk == 0) {
			ChaS.insertLike(nl);
			ChaS.likeplus(nno);
		} else {
			ChaS.deleteLike(nl);
			ChaS.likeminus(nno);
		}

		int likecnt = ChaS.likecnt(nno);

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("chk", chk);
		map.put("cnt", likecnt);

		return map;
	}

	@RequestMapping(value = "likechk", method = { RequestMethod.GET, RequestMethod.POST }) // 좋아요체크
	@ResponseBody
	public ArrayList<Object> likechk(@RequestBody String like, Model model, HttpServletRequest request)  throws Exception{
		HttpSession session = request.getSession();
		Map<Object, Object> map = new HashMap<Object, Object>();
		ArrayList<Object> list = new ArrayList<>();

		List<NewsDTO> nList = ChaS.selectAllN();
		if ((String) session.getAttribute("Id") != null) {
			List<LikeDTO> likeList = ChaS.AllLike((String) session.getAttribute("Id"));
			for (int i = 0; i < nList.size(); i++) {
				int nnum = nList.get(i).getNo();
				for (int j = 0; j < likeList.size(); j++) {
					int lnum = likeList.get(j).getNo();
					if (nnum == lnum) {
						list.add(lnum);
					}
				}
			}
		}
		for (int i = 0; i < list.size(); i++) {
			map.put("like" + i, list.get(i));
		}

		return list;
	}
	@RequestMapping(value = "/chat", method = RequestMethod.GET) // 메인화면 
	public String chat() throws Exception {
		
		return "Chaos2";
	}
}
