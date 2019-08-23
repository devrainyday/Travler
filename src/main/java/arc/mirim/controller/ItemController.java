package arc.mirim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import arc.mirim.domain.ItemVO;
import arc.mirim.service.CourseService;
import arc.mirim.service.ItemService;

@Controller
@RequestMapping("/items/*")
public class ItemController {
	
	@Autowired
	ItemService itemS;
	
	@Autowired
	CourseService courseS;
	
	@GetMapping("/list")
	public String list(Model model) {
		System.out.println("it's item list get");
		List<ItemVO> itemList = itemS.itemGetAll();
		for(ItemVO i : itemList) {
			System.out.println(i);
		}
		model.addAttribute("list", itemList);
		return "/itemList";
	}
	
	@GetMapping("/register")
	public String register(Model model) {
		// Course 제목 목록을 뽑아서 전달해야 함
		System.out.println("it's item register get");
		model.addAttribute("courseTitleList", courseS.courseTitleGet());
		return "/itemRegister";
	}
	
	@PostMapping("/register")
	public String register(ItemVO vo) {
		System.out.println("it's item register post");
		System.out.println(vo);
		return "redirect:/items/list";
	}
	
	@GetMapping("/get")
	public String get(@RequestParam("idx") int idx, Model model) {
			System.out.println("it's item get get");
			ItemVO item = itemS.itemGet(idx);
			System.out.println("aaaaa"+item);
			itemS.itemUpdateHit(idx);
			System.out.println("bbbbb"+item);
			model.addAttribute("item", itemS.itemGet(idx));
			return "/itemGet";
	}
	
	@GetMapping("/modify")
	public String modifyGet(@RequestParam("idx") int idx, Model model) {
		// Course 제목 목록을 뽑아서 전달해야 함
		System.out.println("it's item modify get");
		model.addAttribute("item", itemS.itemGet(idx));
		model.addAttribute("courseTitleList", courseS.courseTitleGet());
		return "/itemModify";
	}
	
	@PostMapping("/modify")
	public String modifyPost(ItemVO vo) {
		System.out.println("it's item modify post");
		itemS.itemModify(vo);
		return "redirect:/items/list";
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("idx") int idx) {
		System.out.println("it's item remove get");
		itemS.itemRemove(idx);
		return "redirect:/items/list";
	}
	
}