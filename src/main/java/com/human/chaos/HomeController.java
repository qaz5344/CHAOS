package com.human.chaos;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

//	@RequestMapping(value = "chaos", method = RequestMethod.GET)
//	public String Chaos() {
//		return "Chaos";
//	}

//	@RequestMapping(value = "join", method = RequestMethod.GET)
//	public String Join(Locale locale, Model model) {
//
//		return "Login/Join";
//	}
//
//	@RequestMapping(value = "login", method = RequestMethod.GET)
//	public String Login(MemberDTO mem,HttpServletRequest h) {
//		return "Login/Login";
//	}

//	@RequestMapping(value = "help", method = RequestMethod.GET)
//	public String Help(Locale locale, Model model) {
//		String authKey = mss.sendAuthMail("tmdgus4720@naver.com");
//		
//		return "Login/Help";
//	}
//	@RequestMapping(value = "add", method = RequestMethod.GET)
//	public String add(HttpServletRequest hr,NewsDTO n) {
//		NewsDTO nDTO = new NewsDTO();
//		nDTO.setContent(hr.getParameter("content"));
//		return "Chaos";
//	}
}
