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
import arc.mirim.domain.Criteria;
import arc.mirim.service.CourseService;

@Controller
@RequestMapping("/courses/*")
public class CourseController {
	
}