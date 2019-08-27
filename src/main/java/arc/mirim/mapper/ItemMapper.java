package arc.mirim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import arc.mirim.domain.ItemVO;

public interface ItemMapper {
	// TRAVELITEM
	
	@Select("SELECT * FROM TRAVELITEM")
	public List<ItemVO> itemGetAll();
	
	@Select("SELECT * FROM TRAVELITEM WHERE tiIdx=#{tiIdx}")
	public ItemVO itemGet(int idx);
	
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
