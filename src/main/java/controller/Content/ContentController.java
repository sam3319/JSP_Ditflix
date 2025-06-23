package controller.Content;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import DAO.Content.ContentDAO;
import DTO.Content.ContentDTO;
import service.Content.ContentGenreSearchService;
import service.Content.ContentModalSearchService;
import service.Content.ContentSearchService;
import service.Content.ContentService;

@WebServlet("*.contentDo")
public class ContentController extends HttpServlet {
	private ContentDAO dao = new ContentDAO();
	private Gson gson = new Gson();
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".contentDo"));
		
		// index 콘텐츠 별 검색
		if(com != null && com.equals("genre")) {
			System.out.println("장르 별 검색 시도");
			ContentService service = new ContentGenreSearchService();
			service.execute(request, response);
		}
	   
		// 모달 콘텐츠 검색	   
		else if(com != null && com.equals("modal")){
			System.out.println("모달 콘텐츠 검색 시도");
			ContentService service = new ContentModalSearchService();
			service.execute(request, response);	
		}
	    
		// 콘텐츠 검색
		else if(com != null && com.equals("search")) {
			System.out.println("콘텐츠 검색 시도");
			ContentService service = new ContentSearchService();
			service.execute(request, response);
		}
	     
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
