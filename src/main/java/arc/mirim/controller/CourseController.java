package arc.mirim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import arc.mirim.domain.CourseVO;
import arc.mirim.service.CourseService;

@Controller
@RequestMapping("/courses/*")
public class CourseController {
	
	@Autowired
	CourseService courseS;
	
	@GetMapping("/list")
	public String list(Model model) {
		System.out.println("it's course list get");
		List<CourseVO> courseList = courseS.courseGetAll();
		for(CourseVO c : courseList) {
			System.out.println(c);
		}
		model.addAttribute("list", courseS.courseGetAll());
		return "/courseList";
	}
	
	@GetMapping("/register")
	public String register() {
		System.out.println("it's course register get");
		return "/courseRegister";
	}
	
	@PostMapping("/register")
	public String register(CourseVO vo) {
		System.out.println("it's course register post");
		courseS.courseRegister(vo);
		return "redirect:/courses/list";
	}
	
	@GetMapping("/get")
	public String get(@RequestParam("idx") int idx, Model model) {
			System.out.println("it's course get get");
			
			System.out.println(courseS.courseGet(idx));
			model.addAttribute("course", courseS.courseGet(idx));
			
			return "/courseGet";
	}
	
	@GetMapping("/modify")
	public String modify(@RequestParam("idx") int idx, Model model) {
		System.out.println("it's course modify get");
		model.addAttribute("course", courseS.courseGet(idx));
		return "/courseModify";
	}
	
	@PostMapping("/modify")
	public String modify(CourseVO vo) {
		System.out.println("it's course modify post");
		courseS.courseModify(vo);
		return "redirect:/courses/list";
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("idx") int idx) {
		System.out.println("it's course remove get");
		courseS.courseRemove(idx);
		return "redirect:/courses/list";
	}
	
}