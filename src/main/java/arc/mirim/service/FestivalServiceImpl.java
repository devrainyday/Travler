package arc.mirim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import arc.mirim.domain.FestivalBoardVO;
import arc.mirim.domain.FestivalVO;
import arc.mirim.domain.festivalNumVO;
import arc.mirim.mapper.FestivalMapper;

@Service
public class FestivalServiceImpl implements FestivalService {
	@Autowired
	FestivalMapper festivalMapper;

	@Override
	public List<FestivalVO> festivalGetAll() {
		System.out.println("Getting all festival");
		return festivalMapper.festivalGetAll();
	}

	@Override
	public FestivalVO festivalGet(int idx) {
		System.out.println("Getting festival");
		return festivalMapper.festivalGet(idx);
	}

	@Override
	public void festivalRegister(FestivalVO vo) {
		System.out.println("Register festival");
		festivalMapper.festivalRegister(vo);
	}

	@Override
	public void festivalRemove(int idx) {
		System.out.println("Remove festival");
		festivalMapper.festivalRemove(idx);
	}

	@Override
	public void festivalModify(FestivalVO vo) {
		System.out.println("Modify festival");
		festivalMapper.festivalModify(vo);
		System.out.println(vo);
	}

	@Override
	public List<festivalNumVO> festivalTitleGet() {
		return festivalMapper.festivalGetTitle();
	}
}
