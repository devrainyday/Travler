package arc.mirim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import arc.mirim.domain.CourseVO;

public interface AdminMapper {

	@Select("SELECT COUNT(*) FROM travelCourse WHERE kind LIKE '%버스%'")
	public List<CourseVO> courseGetBus();
	
	@Select("SELECT COUNT(*) FROM travelCourse WHERE kind LIKE '%기차%'")
	public List<CourseVO> courseGetTrain();
	
	@Select("SELECT COUNT(*) FROM travelCourse WHERE kind LIKE '%도%'")
	public List<CourseVO> courseGetIsland();

}
