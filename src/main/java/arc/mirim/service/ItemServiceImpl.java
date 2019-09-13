package arc.mirim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import arc.mirim.domain.ItemVO;
import arc.mirim.domain.itemNumVO;
import arc.mirim.mapper.ItemMapper;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	ItemMapper itemMapper;
	
	@Override
	public List<ItemVO> itemGetAll() {
		System.out.println("Getting all item");
		return itemMapper.itemGetAll();
	}

	@Override
	public List<itemNumVO> itemNumGet() {
		System.out.println("Getting item num");
		return itemMapper.itemNumGet();
	}

	@Override
	public ItemVO itemGet(int idx) {
		System.out.println("Getting item");
		return itemMapper.itemGet(idx);
	}

	@Override
	public void itemRegister(ItemVO vo) {
		System.out.println("Register item");
		itemMapper.itemRegister(vo);
		System.out.println(vo);
	}

	@Override
	public void itemRemove(int idx) {
		System.out.println("Remove item");
		itemMapper.itemRemove(idx);
	}

	@Override
	public void itemModify(ItemVO vo) {
		System.out.println("Modify item");
		itemMapper.itemModify(vo);
		System.out.println(vo);
	}

	@Override
	public void itemUpdateHit(int idx) {
		System.out.println("Modify item's idx, hit");
		itemMapper.itemUpdateHit(idx);
		System.out.println(idx);
	}

}
