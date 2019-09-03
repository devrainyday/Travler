package arc.mirim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import arc.mirim.domain.FestivalBoardVO;
import arc.mirim.mapper.FestivalBoardMapper;

@Service
public class FestivalBoardServiceImpl implements FestivalBoardService {
	
	@Autowired
	FestivalBoardMapper festivalBoardMapper;

	@Override
	public List<FestivalBoardVO> festivalBoardGetAll() {
		System.out.println("Getting all festival board");
		return festivalBoardMapper.festivalBoardGetAll();
	}

	@Override
	public void festivalBoardRegister(FestivalBoardVO vo) {
		System.out.println("Register festiva boardl");
		festivalBoardMapper.festivalBoardRegister(vo);
	}

	@Override
	public void festivalBoardModify(FestivalBoardVO vo) {
		System.out.println("Modify festival board");
		festivalBoardMapper.festivalBoardModify(vo);
		System.out.println(vo);
	}

	@Override
	public void festivalBoardRemove(int idx) {
		System.out.println("Remove festival board");
		festivalBoardMapper.festivalBoardRemove(idx);
	}
}
