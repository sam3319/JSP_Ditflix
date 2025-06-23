package service.Content;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.Content.ContentDAO;
import DTO.Content.ContentDTO;

public class ContentGenreSearchService implements ContentService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ContentDAO dao = new ContentDAO();
		Gson gson = new Gson();
		
		String genre = request.getParameter("genre");
	    String limitStr = request.getParameter("limit");
	     
	    // JSON 응답 설정
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");

	    try {
			// 장르별 콘텐츠 조회
	        if (genre != null) {
	        	int limit = (limitStr != null) ? Integer.parseInt(limitStr) : 12;
	       	 	List<ContentDTO> contentList = null;
	       	 
	       	 	System.out.println("요청된 장르: " + genre);
	       	 
	       	 	contentList = dao.getContentByGenre(genre, limit);
	       	
	       	 	String jsonResponse = gson.toJson(contentList);
	       	 	System.out.println("JSON 응답: " + jsonResponse);
	       	 
	       	 	response.getWriter().write(jsonResponse);
	       	 
	       	 	return;
	        }       	            
    	}catch (Exception e) {
    		System.out.println("콘텐츠 장르 조회 중 오류 발생");
    		e.printStackTrace();
    	}
	}

}
