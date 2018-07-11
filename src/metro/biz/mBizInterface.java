package metro.biz;

import java.util.List;
import java.util.Map;

import metro.dto.mDto;

public interface mBizInterface {
	
	public mDto getuSellectEnabled(String id);       // 가입된 (Y)정보조회		
	public boolean getuUpdate(mDto mDto);            // 회원정보 수정	
	public boolean getuDelUser(String id);            // 회원 탈퇴	
	public boolean getwInsert(mDto mDto);             // 글쓰기	
	public boolean getwUpdate(mDto mDto);             // 글수정	
	public boolean getwDelete(int writeNo);           // 글삭제
	public boolean getcInsert(mDto mDto);             // 덧글쓰기
	public boolean getcUpdate(String content, int writeNo, int contentNo);   // 덧글수정
	public boolean getcDelete(int writeNo, int contentNo);   //덧글삭제
	
	public boolean getInsertUser(mDto dto);					//회원가입
	public String getIdChk(String id);						//아이디 중복 체크
	public List<mDto> getboard(String role, int rowNo);
	public int getallRow(String role);
	public List<mDto> getsearch(String role, String where, String search, int rowNo);
	public int getsearchRow(String role, String where, String search);
	public mDto getwriteDetail(int writeNo);
	public List<mDto> getcommentDetail(int writeNo);
	public int getCommentAllRow(int writeNo);
	
	public List<mDto> aAllUser(int start, int end);
	public int aAllRow();
	public List<mDto> aSearchUser(String type, String keyword, int start, int end);
	public int aSearchRow(String type, String keyword);
	public boolean aUpdateUser(String role, String enabled,String id);	
	public int login(String id, String password);
	
}