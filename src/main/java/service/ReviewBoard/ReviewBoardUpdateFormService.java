package service.ReviewBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ReviewBoard.ReviewBoardDAO;
import DTO.ReviewBoard.ReviewBoardDTO;

public class ReviewBoardUpdateFormService implements ReviewBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReviewBoardDAO dao = new ReviewBoardDAO();
        
        try {
            HttpSession session = request.getSession(false);
            if(session == null) {
                request.setAttribute("errorMessage", "로그인이 필요합니다.");
                request.setAttribute("redirectUrl", "loginForm.do");
                return;
            }
            
            String loginIdStr = (String) session.getAttribute("loginId");
            if(loginIdStr == null) {
                request.setAttribute("errorMessage", "로그인이 필요합니다.");
                request.setAttribute("redirectUrl", "loginForm.do");
                return;
            }
            
            String reviewIdStr = request.getParameter("id");
            if(reviewIdStr == null) {
                request.setAttribute("errorMessage", "잘못된 접근입니다.");
                request.setAttribute("redirectUrl", "ReviewBoardList.ReviewBoardDo");
                return;
            }
            
            Long reviewId = Long.parseLong(reviewIdStr);
            
            ReviewBoardDTO review = dao.getReviewBoardById(reviewId);
            
            if(review == null) {
                request.setAttribute("errorMessage", "존재하지 않는 리뷰입니다.");
                request.setAttribute("redirectUrl", "ReviewBoardList.ReviewBoardDo");
                return;
            }
            
            if(!review.getLoginId().equals(loginIdStr)) {
                request.setAttribute("errorMessage", "수정 권한이 없습니다.");
                request.setAttribute("redirectUrl", "ReviewBoardPost.ReviewBoardDo?id=" + reviewId);
                return;
            }
            
            request.setAttribute("review", review);
            
            System.out.println("리뷰 수정 폼 데이터 준비 완료");
                   
        } catch (Exception e) {
            System.out.println("리뷰 수정 폼 로드 중 오류 발생");
            e.printStackTrace();
            request.setAttribute("errorMessage", "수정 폼을 불러오는 중 오류가 발생했습니다.");
            request.setAttribute("redirectUrl", "ReviewBoardList.ReviewBoardDo");
        }
	}
}
