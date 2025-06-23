package service.Content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.Content.ContentDAO;
import DTO.Content.ContentDTO;

public class ContentModalSearchService implements ContentService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ContentDAO dao = new ContentDAO();
		Gson gson = new Gson();
		
		String contentIdStr = request.getParameter("contentId");
	    String genre = request.getParameter("genre");
	    String limitStr = request.getParameter("limit");
	     
	    // JSON 응답 설정
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    
	    try {
	    	if(contentIdStr != null) {
	    		 Long contentId = Long.parseLong(contentIdStr);
	    		 ContentDTO content = dao.getContentById(contentId);
	    		 
	    		 String jsonResponse = gson.toJson(content);
	    		 System.out.println("JSON 응답: " + jsonResponse);
	    		 
	    		 response.getWriter().write(jsonResponse);
	    		 return;
	    	 }
	    }catch(Exception e) {
	    	System.out.println("모달 조회 중 오류 발생");
	    	e.printStackTrace();
	    }
	}

}
