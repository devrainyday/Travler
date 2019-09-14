package arc.mirim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import arc.mirim.domain.SecessionVO;

public interface SecessionMapper {
	// SECESSION;

	@Select("SELECT COUNT(*) FROM SECESSION WHERE id=#{id}")
	public int secessionCntById(String id);

    @Insert("INSERT INTO SECESSION (sIdx, id, name) VALUES (SSEQUENCE.nextval, #{id}, #{name})")
    public void registerSecession(@Param("id") String id, @Param("name") String name);
	
    // Secession 은 Update, Delete 하지 않음
}