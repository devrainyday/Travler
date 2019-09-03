package arc.mirim.service;

import java.util.List;

import arc.mirim.domain.FestivalBoardVO;

public interface FestivalBoardService {
	public List<FestivalBoardVO> festivalBoardGetAll();
	public void festivalBoardRegister(FestivalBoardVO vo);
	public void festivalBoardModify(FestivalBoardVO vo);
	public void festivalBoardRemove(int idx);
}
