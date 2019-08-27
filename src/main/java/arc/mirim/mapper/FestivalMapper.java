package arc.mirim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import arc.mirim.domain.FestivalVO;

public interface FestivalMapper {
	// FESTIVAL
	
	@Select("SELECT * FROM FESTIVAL")
	public List<FestivalVO> festivalGetAll();
	
	@Select("SELECT * FROM FESTIVAL WHERE fIdx=#{idx}")
	public FestivalVO festivalGet(int idx);
	
	@Insert("INSERT INTO FESTIVAL (fIdx, title, explain, startDay, endDay, charge, host, address, latitude, longitude, phone, site) "
			+ "VALUES (FSEQUENCE.nextval, #{title}, #{explain}, #{startDay}, #{endDay}, #{charge}, #{host}, #{address}, #{latitude}, #{longitude}, #{phone}, #{site})")
	public void festivalRegister(FestivalVO vo);
	
	@Update("UPDATE FESTIVAL SET "
			+ "title=#{title}, explain=#{explain}, startDay=#{startDay}, endDay=#{endDay}, charge=#{charge}, address=#{address}, latitude=#{latitude}, longitude=#{longitude}, phone=#{phone}, site=#{site} "
			+ "WHERE fIdx=#{fIdx}")
	public void festivalModify(FestivalVO vo);
	
	@Delete("DELETE FESTIVAL WHERE fIdx=#{idx}")
	public void festivalRemove(int idx);
}
