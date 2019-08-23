package arc.mirim.service;

import java.util.List;

import arc.mirim.domain.ItemVO;

public interface ItemService {
	public List<ItemVO> itemGetAll();
	public ItemVO itemGet(int idx);
	public void itemRegister(ItemVO vo);
	public void itemRemove(int idx);
	public void itemModify(ItemVO vo);
	public void itemUpdateHit(int idx);
}