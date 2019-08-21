package arc.mirim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import arc.mirim.domain.ItemVO;
import arc.mirim.mapper.ItemMapper;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	ItemMapper itemMapper;
	
	@Override
	public List<ItemVO> itemGetAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ItemVO itemGet(int idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void itemRegister(ItemVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void itemRemove(int idx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void itemModify(ItemVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void itemUpdateHit(int idx) {
		// TODO Auto-generated method stub
		
	}

}
