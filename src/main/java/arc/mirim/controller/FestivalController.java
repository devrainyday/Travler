package arc.mirim.controller;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import arc.mirim.domain.FestivalVO;
import arc.mirim.service.FestivalService;

@Controller
@RequestMapping("/festivals/*")
public class FestivalController {
	
	@Autowired
	FestivalService festivalS;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) throws Exception {
	    binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {

	        public void setAsText(String text) throws IllegalArgumentException {
	            try {
	                setValue(new SimpleDateFormat("yyyy-MM-dd").parse(text));
	            } catch (ParseException e) {
	                setValue(null);
	            }
	        }
	    });
	}
	
	@GetMapping("/list")
	public String list(Model model) {
		System.out.println("it's festival list get");
		List<FestivalVO> festivalList = festivalS.festivalGetAll();
		for(FestivalVO c : festivalList) {
			System.out.println(c);
		}
		model.addAttribute("list", festivalList);
		return "/festivalList";
	}
	
	@GetMapping("/register")
	public String register() {
		System.out.println("it's festival register get");
		return "/festivalRegister";
	}
	
	@PostMapping("/register")
	public String register(FestivalVO vo) {
		System.out.println("it's festival register post");
		festivalS.festivalRegister(vo);
		return "redirect:/festivals/list";
	}
	
	@GetMapping("/get")
	public String get(@RequestParam("idx") int idx, Model model) {
			System.out.println("it's festival get get");
			
			System.out.println(festivalS.festivalGet(idx));
			model.addAttribute("festival", festivalS.festivalGet(idx));
			
			return "/festivalGet";
	}
	
	@GetMapping("/modify")
	public String modify(@RequestParam("idx") int idx, Model model) {
		System.out.println("it's festival modify get");
		model.addAttribute("festival", festivalS.festivalGet(idx));
		return "/festivalModify";
	}
	
	@PostMapping("/modify")
	public String modify(FestivalVO vo) {
		System.out.println("it's festival modify post");
		festivalS.festivalModify(vo);
		return "redirect:/festivals/list";
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("idx") int idx) {
		System.out.println("it's festival remove get");
		festivalS.festivalRemove(idx);
		return "redirect:/festivals/list";
	}
}
