package arc.mirim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import arc.mirim.domain.MemberVO;
import arc.mirim.domain.SigninDTO;
import arc.mirim.service.MemberService;

@Controller
@RequestMapping("/*")
public class AuthController {
	
	@Autowired
	MemberService memberS;
	
	@GetMapping("/")
	public String index() {
		System.out.println("it's index");
		return "/index";
	}
	
	@PostMapping("/signin")
	public String signinPost(SigninDTO dto, HttpServletRequest request) {
		System.out.println("it's signin post");
		SigninDTO signinDto = memberS.Signin(dto);
		if(signinDto==null) {
			System.out.println("로그인에 실패했습니다");
		} else {
			request.getSession().setAttribute("id", signinDto.getSigninId());
			request.getSession().setAttribute("name", signinDto.getSigninName());
		}
		return "redirect:/index";
	}
	
	@GetMapping("/signup")
	public String signupGet() {
		System.out.println("it's signup get");
		return "/signup";
	}
	
	@PostMapping("/signup")
	public String signupPost(MemberVO vo) {
		System.out.println("it's signup post");
		memberS.Signup(vo);
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/signup/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userId) {
		return memberS.memberIdChk(userId);
	}
	
	@PostMapping("/signout")
	public String signoutPost(HttpServletRequest request) {
		System.out.println("it's signout post");
		request.getSession().removeAttribute("id");
		request.getSession().removeAttribute("name");
		return "redirect:/index";
	}
}