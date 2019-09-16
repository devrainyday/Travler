package arc.mirim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import arc.mirim.domain.CourseVO;
import arc.mirim.domain.SecessionVO;
import arc.mirim.domain.itemNumVO;
import arc.mirim.domain.memberBookingNumVO;
import arc.mirim.domain.memberInfoVO;

public interface AdminMapper {
	
	@Select("SELECT object_name FROM USER_OBJECTS WHERE object_type='TABLE'")
	public List<String> tableNameGetAll();
	
	@Select("SELECT COUNT(*) FROM #{table}")
	public List<Integer> tableCntGet(String table);
	
	@Select("SELECT COUNT(*) FROM travelCourse WHERE kind LIKE '%버스%'")
	public List<CourseVO> courseGetBus();
	
	@Select("SELECT COUNT(*) FROM travelCourse WHERE kind LIKE '%기차%'")
	public List<CourseVO> courseGetTrain();
	
	@Select("SELECT COUNT(*) FROM travelCourse WHERE kind LIKE '%도%'")
	public List<CourseVO> courseGetIsland();

	
	@Select("SELECT * FROM memberInfo")
	public List<memberInfoVO> memberInfoGetAll();
	
	@Select("SELECT mId, COUNT(*) num, getLevel(SUM(totalCharge)) l FROM TRAVELBOOKING WHERE bState='ongoing' GROUP BY mId")
	public List<memberBookingNumVO> memberBookingNumGet();
	
	@Select("SELECT * FROM SECESSION")
	public List<SecessionVO> secessionInfoGetAll();
}