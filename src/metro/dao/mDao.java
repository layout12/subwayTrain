package metro.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.apache.ibatis.session.SqlSession;
import metro.dto.mDto;

public class mDao extends SqlMapConfig implements mDaoInterface {
	
	SqlSession session;
	
	public mDao() {
		session = null;
	}
	
	/*public static void main(String[] args) {
		mDao dao = new mDao();
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", "햄");
		map.put("where", "NICKNAME");
		map.put("role", "USER");
		
		if(dao.search(map).isEmpty()) {
			System.out.println("검색결과 없음");
		} else {
			System.out.println("??");
		}
		
	}*/
	
	@Override //가입된(Y)정보조회
	public mDto uSellectEnabled(String id) {
		mDto res=null;
		
		session=getSqlSessionFactory().openSession(true);
		res=session.selectOne(nameSpace+"uSellectEnabled",id);
		System.out.println("uSellectEnabled 조회");
		
		session.close();
		System.out.println("session 닫기");
		
		return res;
	}

	@Override //회원정보 수정
	public int uUpdate(mDto mDto) {
		int res=0;
		
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.update(nameSpace+"uUpdate",mDto);
			
			if(res>0) {
				session.commit();
				System.out.println("uUpdate 성공");
			}
		} catch (Exception e) {
			System.out.println("uUpdate 실패");
			session.rollback();
			e.printStackTrace();
		} finally {
			System.out.println("session 종료");
			session.close();
		}
		
		return res;
	}

	@Override //회원 탈퇴
	public int uDelUser(String id) {
		
		int res=0;
		
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.update(nameSpace+"uDelUser",id);
			
			if(res>0) {
				session.commit();
				System.out.println("uDelUser 성공");
			}
			
		} catch (Exception e) {
			System.out.println("uDelUser 실패");
			session.rollback();			
			e.printStackTrace();
		} finally {
			System.out.println("session 종료");
			session.close();
		}
		
		return res;
	}

	@Override //글쓰기
	public int wInsert(mDto mDto) {
		
		int res=0;
		
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.insert(nameSpace+"wInsert",mDto);
			
			if(res>0) {
				session.commit();
				System.out.println("wInsert 성공");
			}
			
		} catch (Exception e) {
			System.out.println("wInsert 실패");
			session.rollback();			
			e.printStackTrace();
		} finally {
			System.out.println("session 종료");
			session.close();
		}
		
		return res;
	}

	@Override //회원 글수정
	public int wUpdate(mDto mDto) {
	
		int res=0;
		
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.update(nameSpace+"wUpdate",mDto);
			
			if(res>0) {
				session.commit();
				System.out.println("wUpdate 성공");
			}
			
		} catch (Exception e) {
			System.out.println("wUpdate 실패");
			session.rollback();			
			e.printStackTrace();
		} finally {
			System.out.println("session 종료");
			session.close();
		}		
		
		return res;
	}

	@Override //회원 글 삭제
	public int wDelete(int writeNo) {

		int res=0;
		
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.update(nameSpace+"wDelete",writeNo);
			
			if(res>0) {
				session.commit();
				System.out.println("wDelete 성공");
			}
			
		} catch (Exception e) {
			System.out.println("wDelete 실패");
			session.rollback();			
			e.printStackTrace();
		} finally {
			System.out.println("session 종료");
			session.close();
		}
		
		return res;
	}

	@Override  //덧글 쓰기
	public int cInsert(mDto mDto) {
		SqlSession session=null;
		int res=0;
		
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.insert(nameSpace+"cInsert",mDto);
			
			if(res>0) {
				session.commit();
				System.out.println("cInsert 성공");
			}
			
		} catch (Exception e) {
			System.out.println("cInsert 실패");
			session.rollback();			
			e.printStackTrace();
		} finally {
			System.out.println("session 종료");
			session.close();
		}
		return res;
	}

	@Override  //덧글 수정
	public int cUpdate(Map<String,Object> map) {
	
		int res=0;
		
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.update(nameSpace+"cUpdate",map);
			
			if(res>0) {
				session.commit();
				System.out.println("cUpdate 성공");
			}
			
		} catch (Exception e) {
			System.out.println("cUpdate 실패");
			session.rollback();			
			e.printStackTrace();
		} finally {
			System.out.println("session 종료");
			session.close();
		}
		
		
		return res;
	
	}

	@Override //덧글 삭제
	public int cDelete(Map<String,Integer> map) {
	
		int res=0;
		
		
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.update(nameSpace+"cDelete",map);
			
			if(res>0) {
				session.commit();
				System.out.println("cDelete 성공");
			}
			
		} catch (Exception e) {
			System.out.println("cDelete 실패");
			session.rollback();			
			e.printStackTrace();
		} finally {
			System.out.println("session 종료");
			session.close();
		}
		return res;
	}
	
	@Override	//회원가입
	public int insertUser(mDto dto) {
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(nameSpace+"insertUser", dto);
			
			if(res>0) {
				session.commit();
			}
			System.out.println("insertUser 성공");
		} catch (Exception e) {
			System.out.println("insertUser 실패");
			e.printStackTrace();
			session.rollback();
		} finally {
			System.out.println("session close");
			session.close();
		}
		
		return res;
	}
	
	@Override	//아이디 중복체크
	public String idChk(String id) {
		String res = null;
		
		session = getSqlSessionFactory().openSession(true);
		res = session.selectOne(nameSpace+"idChk", id);
		
		session.close();
		
		return res;
	}

	@Override	//게시판 리스트
	public List<mDto> board(Map<String, Object> map) {
		List<mDto> res = new ArrayList<mDto>();
		
		session = getSqlSessionFactory().openSession(true);
		res = session.selectList(nameSpace+"board", map);
		
		session.close();
		
		return res;
	}

	@Override	//글 갯수 체크
	public int allRow(String role) {
		int res = 0;
		
		session = getSqlSessionFactory().openSession(true);
		res = session.selectOne(nameSpace+"allRow", role);
		
		session.close();
		
		return res;
	}
	
	
	@Override	//게시판 글 검색; 닉네임, 제목, 내용
	public List<mDto> search(Map<String, Object> map) {
		List<mDto> res = new ArrayList<mDto>();
		
		session = getSqlSessionFactory().openSession(true);
		res = session.selectList(nameSpace+"search", map);
		
		session.close();
		
		return res;
	}
	
	@Override	//게시판 검색글 갯수; 닉네임, 제목, 내용
	public int searchRow(Map<String, Object> map) {
		int res = 0;
		
		session = getSqlSessionFactory().openSession(true);
		res = session.selectOne(nameSpace+"searchRow", map);
		
		session.close();
		
		return res;
	}

	@Override	//글 디테일
	public mDto writeDetail(int writeNo) {
		mDto res = new mDto();
		
		session = getSqlSessionFactory().openSession(true);
		res = session.selectOne(nameSpace+"writeDetail", writeNo);
		
		session.close();
		
		return res;
	}

	@Override	//덧글 가져오기
	public List<mDto> commentDetail(int writeNo) {
		List<mDto> res = new ArrayList<mDto>();
		
		session = getSqlSessionFactory().openSession(true);
		res = session.selectList(nameSpace+"commentDetail", writeNo);
		
		session.close();
		
		return res;
	}
	
	public static void main(String[] args) {
		mDao dao = new mDao();
		System.out.println(dao.commentAllRow(21));
	}
	
	@Override	//덧글 갯수 체크
	public int commentAllRow(int writeNo) {
		int res = 0;
		
		session = getSqlSessionFactory().openSession(true);
		res = session.selectOne(nameSpace+"commentAllRow", writeNo);
		
		return res;
	}

	//관리자
	//모든 유저 조회
	public List<mDto> aAllUser(Map<String, Integer> map) {
		List<mDto> res = new ArrayList<mDto>();

		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession(true);

		res = session.selectList(nameSpace + "aAllUser", map);
		
		session.close();

		return res;
	}
	
	//회원 수
	public int aAllRow() {
		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession(true);

		int res = session.selectOne(nameSpace + "aAllRow"); 

		session.close();

		return res;
	}
	
	//회원 검색; 아이디, 이름, 닉네임, 전화번호, 이메일, role, 가입여부
	public List<mDto> aSearchUser(Map<String, Object> map) {
		List<mDto> res = new ArrayList<mDto>();

		SqlSession session = null;
		session = getSqlSessionFactory().openSession(true);
		
		res = session.selectList(nameSpace + "aSearchUser", map);
		session.close();

		return res;
	}
	
	//검색한 데이터의 갯수
	public int aSearchRow(Map<String, String> map) {
		SqlSession session = null;
		
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(nameSpace + "aSearchRow", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}
	
	//회원 role 수정
	public int aUpdateUser(Map<String, String> map) {
		SqlSession session = null;
		
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);

			res = session.update(nameSpace + "aUpdateUser", map);
			
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}
	
	
	//로그인
	public mDto login(Map<String, String> map) {
	    SqlSession session = null;

		mDto res = new mDto();

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(nameSpace + "login", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;

	}


}
