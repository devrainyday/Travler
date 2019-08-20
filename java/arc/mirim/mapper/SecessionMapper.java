package arc.mirim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import arc.mirim.domain.SecessionVO;

public interface SecessionMapper {
	// SECESSION;
	
	@Select("SELECT * FROM SECESSION")
	public List<SecessionVO> secessionGetAll();
	
	@Select("SELECT * FROM SECESSION WHERE sIdx=#{idx}")
	public SecessionVO secessionGet(int idx);
	
	@Select("SELECT * FROM SECESSION WHERE id=#{userid}")
	public List<SecessionVO> secessionGet(String id);

    @Insert("INSERT INTO SECESSION (sIdx, id, name) VALUES (SIDX.nextval, #{userid}, #{username})")
    public void registerSecession(SecessionVO vo);
	
    // Secession 은 Update, Delete 하지 않음
}