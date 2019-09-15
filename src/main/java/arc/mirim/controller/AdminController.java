package arc.mirim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import arc.mirim.domain.courseNumVO;
import arc.mirim.service.AdminService;
import arc.mirim.service.BookingService;
import arc.mirim.service.CourseService;
import arc.mirim.service.ItemService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	AdminService adminS;
	
	@Autowired
	CourseService courseS;
	
	@Autowired
	ItemService itemS;
	
	@Autowired
	BookingService bookingS;
	
	@GetMapping("/")
	public String adminPage(Model model) {
		System.out.println("it's admin page");
		
		model.addAttribute("courseTitle", courseS.courseTitleGet());
		model.addAttribute("itemList", itemS.itemGetAll());
		model.addAttribute("bookingList", bookingS.bookingGetAll());
		
		model.addAttribute("memberInfo", adminS.memberInfoGetAll());
		model.addAttribute("memberBookingNumInfo", adminS.memberBookingNumGet());
		
		model.addAttribute("secessionInfo", adminS.secessionInfoGetAll());
		
		return "/adminPage";
	}
}