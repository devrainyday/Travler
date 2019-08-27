package arc.mirim.service;

import org.apache.ibatis.annotations.Update;

import arc.mirim.domain.FestivalBoardVO;
public interface FestivalBoardService {

	@Update("UPDATE FESTIVALBOARD SET fComment=#{fComment} WHERE fIdx=#{idx}")
	public void festivalModify(FestivalBoardVO vo);
}
