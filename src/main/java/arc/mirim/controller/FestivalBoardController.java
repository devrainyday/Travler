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

import arc.mirim.domain.FestivalBoardVO;
import arc.mirim.domain.FestivalVO;
import arc.mirim.domain.ItemVO;
import arc.mirim.domain.courseNumVO;
import arc.mirim.domain.festivalNumVO;
import arc.mirim.service.FestivalBoardService;
import arc.mirim.service.FestivalService;

@Controller
@RequestMapping("/festivalBoards/*")
public class FestivalBoardController {
	
	@Autowired
	FestivalBoardService festivalBoardS;
	
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
	
	@GetMapping("/")
	public String list(Model model) {
		System.out.println("it's festival board list get");
		List<FestivalBoardVO> festivalBoardList = festivalBoardS.festivalBoardGetAll();
		for(FestivalBoardVO c : festivalBoardList) {
			System.out.println(c);
		}
		
		List<festivalNumVO> festivalTitle = festivalS.festivalTitleGet();
		List<FestivalVO> festivalList = festivalS.festivalGetAll();
		
		model.addAttribute("festivalList", festivalList);
		model.addAttribute("festivalTitle", festivalTitle);
		model.addAttribute("list", festivalBoardList);
		return "/festivalBoard";
	}
	
	@PostMapping("/register")
	public String register(FestivalBoardVO vo) {
		System.out.println("it's festival board register post");
		festivalBoardS.festivalBoardRegister(vo);
		return "redirect:/festivalBoards/";
	}
	
	@PostMapping("/modify")
	public String modify(FestivalBoardVO vo) {
		System.out.println("it's festival board modify post");
		festivalBoardS.festivalBoardModify(vo);
		return "redirect:/festivalBoards/";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("idx") int idx) {
		System.out.println("it's festival board remove post");
		festivalBoardS.festivalBoardRemove(idx);
		return "redirect:/festivalBoards/";
	}
}