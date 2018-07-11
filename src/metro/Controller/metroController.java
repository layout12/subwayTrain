package metro.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metro.biz.mBiz;
import metro.dto.mDto;

@WebServlet("/metroCon.do")
public class metroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public metroController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		mBiz biz = new mBiz();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		if(command.equals("login")) {	//로그인
			String id = request.getParameter("id");
			String password = request.getParameter("password");			
			mDto dto = null;
			
			int res = biz.login(id, password);
			System.out.println(res);
			if(res == 1) {
				dto = biz.getuSellectEnabled(id);
				session.setAttribute("MySession", dto);
				response.sendRedirect("main.jsp");	
			} else if(res == 0){
				jsResponse2("비밀번호가 일치하지 않습니다.","history.back();",response);
			} else if(res == -1) {
				jsResponse2("존재하는 아이디가 없습니다.","history.back();",response);
			}/* else if(res == -2) {
				jsResponse("알 수 없는 오류가 발생헀습니다.","main.jsp",response);
			}*/
			
		} else if(command.equals("logout")) {	//로그아웃
			session.invalidate();
			jsResponse2("다음 방문을 기다리겠습니다", "location.href='main.jsp'", response);
			
		}else if(command.equals("userTable")) {	//유저 테이블
				int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
				int rowSize = Integer.parseInt(request.getParameter("rowSize"));
				int getRow = biz.aAllRow();
				List<mDto> userList = biz.aAllUser(1+rowSize*(pageNumber-1), pageNumber*rowSize);
				request.setAttribute("userList", userList);
				
				dispatch("userTable.jsp?pageNumber="+pageNumber+"&rowSize="+rowSize+"&getRow="+getRow,request,response);
				
		}else if(command.equals("search")) {	//유저 검색
				int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
				int rowSize = Integer.parseInt(request.getParameter("rowSize"));
				String type = request.getParameter("type");
				String keyword = request.getParameter("keyword");
				int getRow = biz.aSearchRow(type, keyword);
				
				System.out.println(type + "야야야야");
				List<mDto> userList = biz.aSearchUser(type, keyword, 1+rowSize*(pageNumber-1), pageNumber*rowSize);	
				request.setAttribute("userList", userList);
				dispatch("userSearchTable.jsp?pageNumber="+pageNumber+"&rowSize="+rowSize+"&getRow="+getRow+"&type="+type,request,response);
				
		}else if(command.equals("updateUser")) {	//role, 탈퇴 여부 수정
				String role = request.getParameter("role");
				String enabled = request.getParameter("enabled");
				String id = request.getParameter("id");
				System.out.println(role + "/" + enabled + "/" + id);
				boolean res = biz.aUpdateUser(role, enabled, id);
				
				out.print(res);
		} else if(command.equals("idChk")) {	//아이디 중복 체크
			String id = request.getParameter("id");			
			String res = biz.getIdChk(id);			
			if(res == null) {
				res = "0";
			}
			response.getWriter().write(res);
			
		} else if(command.equals("register")) {		//회원가입
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String nickName = request.getParameter("nickName");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
						
			//mDto에 생성자를 만들어 주지 않아서
			mDto dto = new mDto();
			dto.setId(id);
			dto.setPassword(password);
			dto.setName(name);
			dto.setNickname(nickName);
			dto.setPhone(phone);
			dto.setEmail(email);
						
			boolean res = biz.getInsertUser(dto);
						
			if(res) {
				jsResponse("회원가입이 되었습니다. 로그인해주세요", "main.jsp", response);				
			} else {
				jsResponse("회원가입과정에서 오류가 발생했습니다.", "main.jsp", response);				
			}
						
		} else if(command.equals("userInfo")) {	//회원 정보 조회	
			String id = request.getParameter("id");
			mDto dto = null;
			dto = biz.getuSellectEnabled(id);			
			request.setAttribute("dto", dto);			
			dispatch("userInfo.jsp",request,response);		
			
		} else if(command.equals("userUpdateForm")) {	//수정페이지로 이동		
			String id = request.getParameter("id");
			mDto dto = null;
			dto = biz.getuSellectEnabled(id);
			request.setAttribute("dto", dto);			
			dispatch("userUpdateForm.jsp",request,response);	
			
		} else if(command.equals("updateMyInfo")) {	//회원정보 수정		
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String nickName = request.getParameter("nickName");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			
			//mDto에 생성자를 만들어 주지 않아서
			mDto dto = new mDto();
			dto.setId(id);
			dto.setPassword(password);
			dto.setName(name);
			dto.setNickname(nickName);
			dto.setPhone(phone);
			dto.setEmail(email);
			
			boolean res = biz.getuUpdate(dto);			
			
			if(res) {				
				session.invalidate();
				jsResponse("수정되었습니다. 다시 로그인해주세요.", "main.jsp", response);
			} else {				
				jsResponse("회원정보수정 과정에서 오류가 발생했습니다.", "main.jsp" , response);
			}
		
		} else if(command.equals("deleteUser")) {	//회원 탈퇴
			String id = request.getParameter("id");			
			boolean res = biz.getuDelUser(id);			
			
			if(res) {
				session.invalidate();				
				jsResponse("이용해 주셔서 감사합니다.", "main.jsp", response);				
			} else {
				jsResponse("회원 탈퇴과정에서 오류가 발생했습니다.", "main.jsp", response);
			}
		} else if(command.equals("noticeList")) {	//게시판 리스트
			String role = request.getParameter("role");
			int rowNo = Integer.parseInt(request.getParameter("rowNo"));
			List<mDto> list = biz.getboard(role, rowNo);
			int allRow = biz.getallRow(role);
			
			request.setAttribute("list", list);
			if(role.equals("ADMIN")) {
				dispatch("noticeList.jsp?allRow="+allRow, request, response);
			} else if(role.equals("USER")) {
				dispatch("commuList.jsp?allRow="+allRow, request, response);
			}
			
		} else if(command.equals("writeDetail")) {	//글 보기
			int writeNo = Integer.parseInt(request.getParameter("writeNo"));
			String rowNo = request.getParameter("rowNo");
			
			mDto dto = biz.getwriteDetail(writeNo);
			List<mDto> list = biz.getcommentDetail(writeNo);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("dto", dto);
			map.put("list", list);
			request.setAttribute("map", map);
			
			if(dto.getRole().equals("ADMIN")) {
				dispatch("noticeDetail.jsp?rowNo="+rowNo, request, response);
			} else if(dto.getRole().equals("USER")) {
				dispatch("commuDetail.jsp?rowNo="+rowNo, request, response);
			}
			
		} else if(command.equals("noticeUpdate")) {	//글 수정 폼
			int writeNo = Integer.parseInt(request.getParameter("writeNo"));
			String rowNo = request.getParameter("rowNo");
			mDto dto = biz.getwriteDetail(writeNo);
			request.setAttribute("dto", dto);
			
			dispatch("noticeUpdate.jsp?rowNo="+rowNo, request, response);
		} else if(command.equals("writeUpdateAfter")) {	//글 수정
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int writeNo = Integer.parseInt(request.getParameter("writeNo"));
			String rowNo = request.getParameter("rowNo");
			
			mDto dto = new mDto();
			dto.setTitle(title);
			dto.setContent(content);
			dto.setWriteNo(writeNo);
			
			boolean tf = biz.getwUpdate(dto);
			String url = "metroCon.do?command=writeDetail&writeNo="+writeNo+"&rowNo="+rowNo;
			
			if(tf) {
				jsResponse("글 수정 완료",url,response);
			} else {
				jsResponse("글 수정 과정에서 오류가 발생했습니다",url,response);
			}
		} else if(command.equals("writeAfter")) {	//글 쓰기
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String id = request.getParameter("id");
			String role = request.getParameter("role");
			String nickname = request.getParameter("nickname");
			
			mDto dto = new mDto();
			dto.setTitle(title);
			dto.setContent(content);
			dto.setId(id);
			dto.setRole(role);
			dto.setNickname(nickname);
			
			boolean tf = biz.getwInsert(dto);
			String url = "metroCon.do?command=noticeList&role="+role+"&rowNo=1";
			
			if(tf) {
				jsResponse("글 작성 완료",url,response);
			} else {
				jsResponse("글 작성 과정에서 오류가 발생했습니다",url,response);
			}
		} else if(command.equals("writeDelete")) {	//글 삭제
			int writeNo = Integer.parseInt(request.getParameter("writeNo"));
			String role = request.getParameter("role");
			boolean tf = biz.getwDelete(writeNo);
			
			String url = "metroCon.do?command=noticeList&role="+role+"&rowNo=1";
			
			if(tf) {
				jsResponse("글 삭제 완료",url,response);
			} else {
				jsResponse("글 삭제 과정에서 오류가 발생했습니다",url,response);
			}
		} else if(command.equals("writeSearch")) {	//닉네임, 제목, 내용 검색
			String role = request.getParameter("role");
			String where = request.getParameter("where");
			String search = request.getParameter("search");
			int rowNo = Integer.parseInt(request.getParameter("rowNo"));
			
			int allRow = biz.getsearchRow(role, where, search);
			List<mDto> list = biz.getsearch(role, where, search, rowNo);
			
			if(allRow>0) {
				request.setAttribute("list", list);
				dispatch("commuList.jsp?allRow="+allRow, request, response);
			} else {
				jsResponse("해당 결과가 없습니다", "metroCon.do?command=noticeList&role="+role+"&rowNo=1", response);
			}
			
		} else if(command.equals("commentDel")) {	//덧글 삭제
			int writeNo = Integer.parseInt(request.getParameter("writeNo"));
			int commentNo = Integer.parseInt(request.getParameter("commentNo"));
			String rowNo = request.getParameter("rowNo");
			
			boolean tf = biz.getcDelete(writeNo, commentNo);
			if(tf) {
				jsResponse("덧글 삭제 완료", "metroCon.do?command=writeDetail&writeNo="+writeNo+"&rowNo="+rowNo, response);
			} else {
				jsResponse("덧글 삭제 과정에서 오류가 발생하였습니다.", "metroCon.do?command=writeDetail&writeNo="+writeNo+"&rowNo="+rowNo, response);
			}
		} else if(command.equals("commentUpdate")) {	//덧글 수정
			int writeNo = Integer.parseInt(request.getParameter("writeNo"));
			int commentNo = Integer.parseInt(request.getParameter("commentNo"));
			String content = request.getParameter("content");
			String rowNo = request.getParameter("rowNo");
			
			boolean tf = biz.getcUpdate(content, writeNo, commentNo);
			if(tf) {
				jsResponse("덧글 수정 완료", "metroCon.do?command=writeDetail&writeNo="+writeNo+"&rowNo="+rowNo, response);
			} else {
				jsResponse("덧글 수정 과정에서 오류가 발생하였습니다.", "metroCon.do?command=writeDetail&writeNo="+writeNo+"&rowNo="+rowNo, response);
			}
		} else if(command.equals("commentInsert")) {	//덧글 쓰기
			int writeNo = Integer.parseInt(request.getParameter("writeNo"));
			int commentNo = biz.getCommentAllRow(writeNo)+1;
			String id = request.getParameter("id");
			String nickname = request.getParameter("nickname");
			String content = request.getParameter("content");
			String rowNo = request.getParameter("rowNo");
			
			mDto dto = new mDto();
			dto.setWriteNo(writeNo);
			dto.setCommentNo(commentNo);
			dto.setId(id);
			dto.setContent(content);
			dto.setNickname(nickname);
			
			boolean tf = biz.getcInsert(dto);
			if(tf) {
				jsResponse("덧글 업로드 완료", "metroCon.do?command=writeDetail&writeNo="+writeNo+"&rowNo="+rowNo, response);
			} else {
				jsResponse("덧글 업로드 과정에서 오류가 발생하였습니다.", "metroCon.do?command=writeDetail&writeNo="+writeNo+"&rowNo="+rowNo, response);
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>alert('"+msg+"');" + "location.href = '"+url+"';" + "</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	public void jsResponse2(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>alert('"+msg+"');" + url + "</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}

}
