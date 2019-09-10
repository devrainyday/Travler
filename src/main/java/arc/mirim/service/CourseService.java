package arc.mirim.service;

import java.util.List;

import arc.mirim.domain.CourseVO;
import arc.mirim.domain.courseNumVO;

public interface CourseService {
	public List<CourseVO> courseGetAll();
	public List<CourseVO> courseGetBus();
	public List<CourseVO> courseGetTrain();
	public List<CourseVO> courseGetIsland();
	
	public String courseGetTitleByIdx(int idx);
	public CourseVO courseGet(int idx);
	public void courseRegister(CourseVO vo);
	public void courseRemove(int idx);
	public void courseModify(CourseVO vo);
	public List<courseNumVO> courseTitleGet();
}
