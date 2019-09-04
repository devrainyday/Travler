package arc.mirim.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import arc.mirim.mapper.MemberMapper;
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
		System.out.println(dto);
		SigninDTO signinDto = memberS.Signin(dto);
		System.out.println(signinDto);
		if(signinDto==null) {
			System.out.println("로그인에 실패했습니다");
		} else {
			System.out.println("로그인에 성공했습니다");
			request.getSession().setAttribute("sessionId", signinDto.getId());
			request.getSession().setAttribute("sessionName", signinDto.getName());
			
		}
		return "redirect:/";
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
		return "redirect:/";
	}
	
	@GetMapping("/signup/idCheck")
	@ResponseBody
	public Map<Object, Object> idCheck(@RequestParam("userId") String userId) {
		int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
        count = memberS.memberIdChk(userId);
        map.put("cnt", count);
		return map;
	}
	
	@PostMapping("/signout")
	public String signoutPost(HttpServletRequest request) {
		System.out.println("it's signout post");
		request.getSession().removeAttribute("sessionId");
		request.getSession().removeAttribute("sessionName");
		return "redirect:/";
	}
}