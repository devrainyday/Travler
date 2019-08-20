package arc.mirim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import arc.mirim.domain.CourseVO;

public interface CourseMapper {
	// TRAVELCOURSE
	
	@Select("SELECT * FROM TRAVELCOURSE")
	public List<CourseVO> courseGetAll();
	
	@Select("SELECT * FROM TRAVELCOURSE WHERE tcIdx=#{idx}")
	public CourseVO courseGet(int idx);
	
	@Insert("INSERT INTO TRAVELCOURSE (tcIdx, title, kind, startPlace, traffic, travelTerm, tCourse, tTravelPlace, tWarning, latitude, longitude) "
			+ "VALUES (TCIDX.nextval, #{title}, #{kind}, #{startPlace}, #{traffic}, #{travelTerm}, #{tCourse}, #{tTravelPlace}, #{tWarning}, #{latitude}, #{longitude})")
	public void courseRegister(CourseVO vo);
	
	@Delete("DELETE TRAVELCOURSE WHERE tcIdx=#{idx}")
	public void courseRemove(int idx);
	
	@Update("UPDATE TRAVELCOURSE SET "
			+ "title=#{title}, kind=#{kind}, startPlace=#{startPlace}, traffic=#{traffic}, travelTerm=#{travelTerm}, tCourse=#{tCourse}, tTravelPlace=#{tTravelPlace}, tWarning=#{tWarning}, latitude=#{latitude}, longitude=#{longitude} "
			+ "WHERE tcIdx=#{idx}")
	public void courseModify(CourseVO vo);
    
}
