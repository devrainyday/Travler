package arc.mirim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@GetMapping("/all")
	public String travelAllGet(Model model) {
		System.out.println("it's all travel");
		List<CourseVO> courseList = courseS.courseGetAll();
		model.addAttribute("courseList", courseList);
		List<ItemVO> itemList = itemS.itemGetAll();
		model.addAttribute("itemList", itemList);
		return "/travelList";
	}
	
	@GetMapping("/booking")
	public String travelBookingAllGet(Model model, HttpServletRequest request) {
		model.addAttribute("memberBooking", bookingS.bookingGetByMember((String)(request.getSession().getAttribute("sessionId"))));
		return "/travelList";
	}
	
	@PostMapping("/booking/register")
	public void travelBookingRegister(BookingVO vo) {
		bookingS.bookingRegister(vo);
	}
}