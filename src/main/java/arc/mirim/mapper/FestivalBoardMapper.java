package arc.mirim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import arc.mirim.domain.FestivalBoardVO;

public interface FestivalBoardMapper {
	
	@Select("SELECT * FROM FESTIVALBOARD")
	public List<FestivalBoardVO> festivalBoardGetAll();
	
	@Insert("INSERT INTO FESTIVALBOARD (fbIdx, fetivalNum, memberId, memberName, fComment) "
			+ "VALUES (FBSEQUENCE.nextval, #{fetivalNum}, #{memberId}, #{memberName}, #{fComment})")
	public void festivalBoardRegister(FestivalBoardVO vo);
	
	@Update("UPDATE FESTIVALBOARD SET fComment=#{fComment} WHERE fbIdx=#{idx}")
	public void festivalBoardModify(FestivalBoardVO vo);
	
	@Delete("DELETE FESTIVALBOARD WHERE fbIdx=#{idx}")
	public void festivalBoardRemove(int idx);
}
