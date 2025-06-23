package service.Content;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.Content.ContentDAO;
import DTO.Content.ContentDTO;

public class ContentSearchService implements ContentService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ContentDAO dao = new ContentDAO();
		Gson gson = new Gson();
		
		String keyword = request.getParameter("keyword");
		String limitStr = request.getParameter("limit");
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			if(keyword == null || keyword.trim().isEmpty()) {
				response.setStatus(400);
				response.getWriter().write("{\"error\" : \"검색어를 입력하세요.\"}");
				return;
			}
			
			int limit = limitStr != null ? Integer.parseInt(limitStr) : 20;
			
			// 콘텐츠 검색 100개 제한
			if(limit <= 0 || limit > 100) {
				limit = 20;
			}
			// JSON 응답 설정ww
				
			List<ContentDTO> dtos = dao.getContentSearch(keyword.trim(), limit);
			
			String jsonResponse = gson.toJson(dtos);
				
			response.getWriter().write(jsonResponse);
			
		}catch(Exception e) {
			System.out.println("콘텐츠 검색 중 오류 발생");
			e.printStackTrace();
		}		
	}
}
