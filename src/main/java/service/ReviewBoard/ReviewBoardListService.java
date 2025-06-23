package service.ReviewBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ReviewBoard.ReviewBoardDAO;
import DTO.FreeBoard.PageDTO;
import DTO.ReviewBoard.ReviewBoardDTO;

public class ReviewBoardListService implements ReviewBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReviewBoardDAO dao = new ReviewBoardDAO();
        
        try {
            int page = Integer.parseInt(request.getParameter("page") != null ? 
                       request.getParameter("page") : "1");
            String searchKeyword = request.getParameter("searchKeyword");
            String searchType = request.getParameter("searchType");
            
            int pageSize = 12; // 12개 씩 표시
            
            long totalElements = dao.getReviewBoardCount(searchKeyword, searchType);
            
            PageDTO pageInfo = new PageDTO(page, pageSize, totalElements);
            
            List<ReviewBoardDTO> reviewList = dao.getReviewBoardList(pageInfo.getOffset(), pageInfo.getPageSize(), searchKeyword, searchType);
            
            request.setAttribute("reviewList", reviewList);
            request.setAttribute("pageInfo", pageInfo);
            request.setAttribute("searchKeyword", searchKeyword);
            request.setAttribute("searchType", searchType);
            
            System.out.println("리뷰 목록 데이터 준비 완료: " + reviewList.size() + "개");
            
        } catch (Exception e) {
            System.out.println("리뷰 목록 조회 중 오류 발생");
            e.printStackTrace();
            
            request.setAttribute("reviewList", new java.util.ArrayList<>());
            request.setAttribute("errorMessage", "리뷰 목록을 불러오는 중 오류가 발생했습니다.");
        }
    }
}