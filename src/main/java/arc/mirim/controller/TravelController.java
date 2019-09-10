package arc.mirim.controller;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import arc.mirim.domain.BookingVO;
import arc.mirim.domain.CourseVO;
import arc.mirim.domain.ItemVO;
import arc.mirim.service.BookingService;
import arc.mirim.service.CourseService;
import arc.mirim.service.ItemService;

@Controller
@RequestMapping("/travels/*")
public class TravelController {

	@Autowired
	CourseService courseS;
	
	@Autowired
	ItemService itemS;
	
	@Autowired
	BookingService bookingS;
	
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
	public String travelAllGet(Model model) {
		System.out.println("it's all travel");
		List<CourseVO> courseList = courseS.courseGetAll();
		model.addAttribute("courseList", courseList);
		List<ItemVO> itemList = itemS.itemGetAll();
		model.addAttribute("itemList", itemList);
		return "/travelList";
	}
	
	@GetMapping("/getBookingInfo")
	@ResponseBody
	public LinkedHashMap<Object, Object> getBookingInfo (@RequestParam("itemNum") int itemNum) {
		LinkedHashMap<Object, Object> map = new LinkedHashMap<Object, Object>();
        ItemVO vo = itemS.itemGet(itemNum);
        map.put("title", courseS.courseGetTitleByIdx(vo.gettCourseNum()));
        map.put("charge", vo.getCharge());
        map.put("childCharge", vo.getChildCharge());
        map.put("infantCharge", vo.getInfantCharge());
        map.put("startDay", vo.getStartDay());
        map.put("endDay", vo.getEndDay());
        
        System.out.println("ajax 리턴");
        return map;
	}
	
	@GetMapping("/booking")
	public String travelBookingAllGet(Model model, HttpServletRequest request) {
		model.addAttribute("memberBooking", bookingS.bookingGetByMember((String)(request.getSession().getAttribute("sessionId"))));
		return "/travelList";
	}
	
	@PostMapping("/booking/register")
	public String travelBookingRegister(BookingVO vo) {
		bookingS.bookingRegister(vo);
		return "redirect:/travels/";
	}
}