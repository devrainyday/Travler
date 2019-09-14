package arc.mirim.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import arc.mirim.domain.MemberVO;
import arc.mirim.service.MemberService;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	
	@Autowired
	MemberService myPageS;
	
	@GetMapping("/")
	public String myPage(Model model, HttpServletRequest request) {
		System.out.println("it's mypage");
		model.addAttribute("memberInfo", myPageS.memberGet((String)(request.getSession().getAttribute("sessionId"))));
		return "/myPage";
	}
	
	@PostMapping("/modify")
	public String myPageModify(MemberVO vo) {
		myPageS.memberModify(vo);
		return "redirect:/mypage/";
	}
	
	@GetMapping("/pwdCheck")
	@ResponseBody
	public Map<Object, Object> pwdCheck(@RequestParam("id") String id, @RequestParam("oldPwd") String oldPwd) {
		System.out.println(id);
		System.out.println(oldPwd);
		
		int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
        count = myPageS.memberPwdChk(id, oldPwd);
        map.put("cnt", count);
		return map;
	}
	
	@PostMapping("/pwdModify")
	public String myPwdModify(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String pwd = request.getParameter("pwd");
		System.out.println(pwd);
		myPageS.pwdModify((String)(request.getSession().getAttribute("sessionId")), pwd);
		return "redirect:/";
	}
	
	@PostMapping("/secession")
	public String myPageRemove(HttpServletRequest request) {
		
		myPageS.memberRemove((String)(request.getSession().getAttribute("sessionId")), (String)(request.getSession().getAttribute("sessionName")));
		
		request.getSession().removeAttribute("sessionId");
		request.getSession().removeAttribute("sessionName");
		return "redirect:/";
	}
}
