package arc.mirim.service;

import java.util.List;

import arc.mirim.domain.FestivalVO;

public interface FestivalService {
	public List<FestivalVO> festivalGetAll();
	public FestivalVO festivalGet(int idx);
	public void festivalRegister(FestivalVO vo);
	public void festivalRemove(int idx);
	public void festivalModify(FestivalVO vo);
}
