package metro.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import metro.dto.mDto;

public interface mDaoInterface {
	
	String nameSpace = "metro.metro.";
	
	public mDto uSellectEnabled(String id);       // 가입된 (Y)정보조회		
	public int uUpdate(mDto mDto);            // 회원정보 수정	
	public int uDelUser(String id);            // 회원 탈퇴	
	public int wInsert(mDto mDto);             // 글쓰기	
	public int wUpdate(mDto mDto);             // 글수정	
	public int wDelete(int writeNo);           // 글삭제
	public int cInsert(mDto mDto);             // 덧글쓰기
	public int cUpdate(Map<String,Object> map);   // 덧글수정
	public int cDelete(Map<String,Integer> map);   //덧글삭제
	
	public int insertUser(mDto dto);
	public String idChk(String id);
	public List<mDto> board(Map<String, Object> map);
	public int allRow(String role);
	public List<mDto> search(Map<String, Object> map);
	public int searchRow(Map<String, Object> map);
	public mDto writeDetail(int writeNo);
	public List<mDto> commentDetail(int writeNo);
	public int commentAllRow(int writeNo);
	
	public List<mDto> aAllUser(Map<String, Integer> map);
	public int aAllRow();
	public List<mDto> aSearchUser(Map<String, Object> map);
	public int aSearchRow(Map<String, String> map);
	public int aUpdateUser(Map<String, String> map);

	public mDto login(Map<String, String> map);
}
