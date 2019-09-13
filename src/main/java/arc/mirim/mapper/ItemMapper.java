package arc.mirim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import arc.mirim.domain.CourseVO;
import arc.mirim.domain.ItemVO;
import arc.mirim.domain.itemNumVO;

public interface ItemMapper {
	// TRAVELITEM
	
	@Select("SELECT * FROM TRAVELITEM")
	public List<ItemVO> itemGetAll();
	
	@Select("SELECT COUNT(*) FROM travelCourse WHERE kind LIKE '%버스%'")
	public List<CourseVO> courseGetBus();
	
	@Select("SELECT COUNT(*) FROM travelCourse WHERE kind LIKE '%기차%'")
	public List<CourseVO> courseGetTrain();
	
	@Select("SELECT COUNT(*) FROM travelCourse WHERE kind LIKE '%도%'")
	public List<CourseVO> courseGetIsland();
	
	
	@Select("SELECT * FROM TRAVELITEM WHERE tiIdx=#{tiIdx}")
	public ItemVO itemGet(int idx);
	
	@Select("SELECT tItemNum, COUNT(*) num FROM TRAVELBOOKING WHERE bState='ongoing' GROUP BY tItemNum")
	public List<itemNumVO> itemNumGet(); 
	
	@Insert("INSERT INTO TRAVELITEM (tiIdx, tCourseNum, startDay, endDay, charge, childCharge, infantCharge, minMan, maxMan, managerMan, managerCall) "
			+ "VALUES (TISEQUENCE.nextval, #{tCourseNum}, #{startDay}, #{endDay}, #{charge}, #{childCharge}, #{infantCharge}, #{minMan}, #{maxMan}, #{managerMan}, #{managerCall})")
	public void itemRegister(ItemVO vo);
	
	@Delete("DELETE TRAVELITEM WHERE tiIdx=#{tiIdx}")
	public void itemRemove(int idx);
	
	@Update("UPDATE TRAVELITEM SET charge=#{charge}, childCharge=#{childCharge}, infantCharge=#{infantCharge}, minMan=#{minMan}, maxMan=#{maxMan}, managerMan=#{managerMan}, managerCall=#{managerCall} "
			+ "WHERE tiIdx=#{tiIdx}")
	public void itemModify(ItemVO vo);

	@Update("UPDATE TRAVELITEM SET hit = hit+1 WHERE tiIdx=#{idx}")
	public void itemUpdateHit(int idx);
}
