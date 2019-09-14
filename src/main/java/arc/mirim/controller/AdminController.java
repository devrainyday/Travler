package arc.mirim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import arc.mirim.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	AdminService adminS;
	
	@GetMapping("/")
	public String adminPage(Model model) {
		System.out.println("it's admin page");
		
		model.addAttribute("memberInfo", adminS.memberInfoGetAll());
		model.addAttribute("memberBookingNumInfo", adminS.memberBookingNumGet());
		model.addAttribute("secessionInfo", adminS.secessionInfoGetAll());
		
		return "/adminPage";
	}
}