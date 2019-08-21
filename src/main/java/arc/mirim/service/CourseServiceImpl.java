package arc.mirim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import arc.mirim.domain.CourseVO;
import arc.mirim.mapper.CourseMapper;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	CourseMapper courseMapper;
	
	@Override
	public List<CourseVO> courseGetAll() {
		System.out.println("Getting all course");
		return courseMapper.courseGetAll();
	}

	@Override
	public CourseVO courseGet(int idx) {
		System.out.println("Getting course");
		return courseMapper.courseGet(idx);
	}

	@Override
	public void courseRegister(CourseVO vo) {
		System.out.println("Register course");
		courseMapper.courseRegister(vo);
	}

	@Override
	public void courseModify(CourseVO vo) {
		System.out.println("Modify course");
		courseMapper.courseModify(vo);
		System.out.println(vo);
	}

	@Override
	public void courseRemove(int idx) {
		System.out.println("Remove course");
		courseMapper.courseRemove(idx);
	}
}
