package metro.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

@WebServlet("/metroApi.do")
public class metroApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public metroApi() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		System.out.println(start + " // " + end);
		
		String url = "http://swopenapi.seoul.go.kr/api/subway/536377555074696e3131306148427970/xml/shortestRoute/0/5/"+start+"/"+end;

		System.out.println(url);
		
		Document doc = Jsoup.connect(url).timeout(300000).get();
		
		System.out.println(doc.select("shtStatnNm").eq(0).text());
		
		String data = doc.select("shtStatnId").eq(0).text() + "/" +doc.select("shtStatnNm").eq(0).text() + "/" + doc.select("shtTravelMsg").eq(0).text();
		
		PrintWriter out = response.getWriter();
		
		out.println(data);
		
	}

}
