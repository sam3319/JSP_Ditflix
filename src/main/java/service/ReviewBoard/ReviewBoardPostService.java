package service.ReviewBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ReviewBoard.ReviewBoardDAO;
import DTO.ReviewBoard.ReviewBoardDTO;

public class ReviewBoardPostService implements ReviewBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReviewBoardDAO dao = new ReviewBoardDAO();
        
        try {
            String reviewIdStr = request.getParameter("id");
            
            if(reviewIdStr == null) {
                System.out.println("리뷰 ID가 없습니다.");
                request.setAttribute("errorMessage", "잘못된 접근입니다.");
                return;
            }
            
            Long reviewId = Long.parseLong(reviewIdStr);
            System.out.println("조회할 리뷰 ID: " + reviewId);
            
            ReviewBoardDTO review = dao.getReviewBoardById(reviewId);
            
            if(review == null) {
                System.out.println("해당 리뷰가 존재하지 않습니다.");
                request.setAttribute("errorMessage", "존재하지 않는 리뷰입니다.");
                return;
            }
            
            dao.increaseViewCount(reviewId); // 조회수 증가 시키기
            
            request.setAttribute("review", review);
            
            System.out.println("리뷰 상세 데이터 준비 완료");
                   
        } catch (Exception e) {
            System.out.println("리뷰 상세 조회 중 오류 발생");
            e.printStackTrace();
            request.setAttribute("errorMessage", "리뷰를 불러오는 중 오류가 발생했습니다.");
        }
	}
}
