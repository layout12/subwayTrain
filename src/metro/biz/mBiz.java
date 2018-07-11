package metro.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import metro.dao.mDao;
import metro.dto.mDto;

public class mBiz implements mBizInterface {
	
mDao dao = new mDao();
	
	@Override	//가입된(Y)정보조회
	public mDto getuSellectEnabled(String id) {
		
		return dao.uSellectEnabled(id);
	}

	@Override	//회원정보 수정
	public boolean getuUpdate(mDto mDto) {		
		int res = dao.uUpdate(mDto);
		
		if(res > 0) {
			return true;
		}else {
			return false;
		}
		
	}

	@Override	//회원 탈퇴
	public boolean getuDelUser(String id) {
		int res = dao.uDelUser(id);
		
		if(res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override	//글쓰기
	public boolean getwInsert(mDto mDto) {
		int res = dao.wInsert(mDto);
		
		if(res > 0) {
			return true;
		} else {
			return false;
		}	
	}

	@Override	//회원 글수정
	public boolean getwUpdate(mDto mDto) {
		int res = dao.wUpdate(mDto); 
		
		if(res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override	//회원 글 삭제
	public boolean getwDelete(int writeNo) {
		int res = dao.wDelete(writeNo); 
		
		if(res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override	//덧글 쓰기
	public boolean getcInsert(mDto mDto) {
		int res = dao.cInsert(mDto);
		
		if(res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override	//덧글 수정
	public boolean getcUpdate(String content, int writeNo, int commentNo) {
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("content", content);
		map.put("writeNo", writeNo);
		map.put("commentNo", commentNo);
		
		int res = dao.cUpdate(map) ;
		
		if(res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override	//덧글 삭제
	public boolean getcDelete(int writeNo, int commentNo) {
		Map<String, Integer> map= new HashMap<String, Integer>();
		map.put("writeNo", writeNo);
		map.put("commentNo", commentNo);
		
		int res = dao.cDelete(map);
		
		if(res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override	//회원가입
	public boolean getInsertUser(mDto dto) {
		int res = dao.insertUser(dto);
		
		if(res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override	//아이디 중복체크
	public String getIdChk(String id) {
		
		return dao.idChk(id);
	}

	@Override	//게시판 리스트
	public List<mDto> getboard(String role, int rowNo) {
		int end = rowNo*10;
		int start = end-9;
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("role", role);
		map.put("start", start);
		map.put("end", end);
		
		return dao.board(map);
	}

	@Override	//글 갯수 체크
	public int getallRow(String role) {
		
		return dao.allRow(role);
	}

	@Override	//게시판 글 검색; 닉네임, 제목, 내용
	public List<mDto> getsearch(String role, String where, String search, int rowNo) {
		int end = rowNo*10;
		int start = end-9;
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("role", role);
		map.put("where", where);
		map.put("search", search);
		map.put("start", start);
		map.put("end", end);
		
		return dao.search(map);
	}
	
	public int getsearchRow(String role, String where, String search) {
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("role", role);
		map.put("where", where);
		map.put("search", search);
		
		return dao.searchRow(map);
	}

	@Override	//글 디테일
	public mDto getwriteDetail(int writeNo) {
		
		return dao.writeDetail(writeNo);
	}

	@Override	//덧글 가져오기
	public List<mDto> getcommentDetail(int writeNo) {
		/*int end = rowNo*10;
		int start = end-9;
		
		Map<String, Integer> map= new HashMap<String, Integer>();
		map.put("writeNo", writeNo);
		map.put("start", start);
		map.put("end", end);*/
		
		return dao.commentDetail(writeNo);
	}
	
	public static void main(String[] args) {
		mBiz biz = new mBiz();
		int res = biz.getCommentAllRow(21);
		System.out.println(res);
	}
	
	@Override	//덧글 갯수 체크
	public int getCommentAllRow(int writeNo) {
		
		return dao.commentAllRow(writeNo);
	}

	//관리자
	@Override	//모든 유저 조회
	public List<mDto> aAllUser(int start, int end) {
		Map<String, Integer> map = new HashMap<>();
		
		map.put("start", start);
		map.put("end", end);
		
		return dao.aAllUser(map);
	}

	@Override	//회원 수
	public int aAllRow() {
		
		return dao.aAllRow();
	}

	@Override	//회원 검색; 아이디, 이름, 닉네임, 전화번호, 이메일, role, 가입여부
	public List<mDto> aSearchUser(String type, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return dao.aSearchUser(map);
	}

	@Override	//검색한 데이터의 갯수
	public int aSearchRow(String type, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("type", type);
		map.put("keyword", keyword);
		
		return dao.aSearchRow(map);
	}

	@Override	//회원 role 수정
	public boolean aUpdateUser(String role, String enabled,String id) {
		Map<String, String> map = new HashMap<>();
		map.put("role", role);
		map.put("enabled", enabled);
		map.put("id", id);
		
		int res = dao.aUpdateUser(map);
		
		if(res > 0) {
			return true;
		} else {
			return false;
		}
	}


	@Override	//로그인
	public int login(String id, String password) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		
		mDto dto = dao.login(map);
		
		if(dto == null) {
			return -1;	//아이디 없음
		} else {
			if (dto.getPassword().equals(password)) {
				return 1; // 로그인 성공
			} else {
				return 0; // 비밀번호 불일치
			}
		}
		
		//return -2;	//데이터베이스 오류
	}

}
