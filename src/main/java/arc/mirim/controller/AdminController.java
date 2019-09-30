package arc.mirim.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import arc.mirim.domain.SigninDTO;
import arc.mirim.domain.courseNumVO;
import arc.mirim.domain.tableCntVO;
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
		
		List<tableCntVO> tableCntList = new ArrayList<tableCntVO>();
		List<String> tableNameList = adminS.tableNameGetAll();
		
		tableCntVO vo = new tableCntVO();
		int cnt = 0;
		
		for(String tableName : tableNameList) {
			
			cnt = adminS.tableCntGet(tableName);
			
			vo.setTableName(tableName);
			vo.setCnt(cnt);
			
			tableCntList.add(vo);
			
			System.out.println(vo);
			
			vo = new tableCntVO();
		}
		
		model.addAttribute("tableCnt", tableCntList);
		
		for(Object s : tableCntList) {
			System.out.println(s);
		}
		
		model.addAttribute("cIBCnt", adminS.cIBCnt());
		model.addAttribute("courseCnt", adminS.courseCnt());
		model.addAttribute("itemCnt", adminS.itemCnt());
		
		model.addAttribute("fFestivalBoardCnt", adminS.fFestivalBoardCnt());
		model.addAttribute("memberBookingCnt", adminS.memberBookingCnt());
		model.addAttribute("memberOnGoingBookingCnt", adminS.memberOnGoingBookingCnt());
		model.addAttribute("memberFestivalBoardCnt", adminS.memberFestivalBoardCnt());
		
		return "/adminPage";
	}
	
	@PostMapping("/setMemberPwd")
	public String setMemberPwd(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String id = (String) request.getParameter("id");
		
		System.out.println("it's set Member Pwd post");
		adminS.setMemberPwd(id);
		System.out.println("set user ["+id+"] pwd");
		return "redirect:/";
	}
}