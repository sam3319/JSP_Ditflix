package service.ReviewBoard;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ReviewBoard.ReviewBoardDAO;
import DTO.ReviewBoard.ReviewBoardDTO;

public class ReviewBoardDeleteService implements ReviewBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			ReviewBoardDAO dao = new ReviewBoardDAO();
        
        try {
            HttpSession session = request.getSession(false);
            if(session == null) {
                response.sendRedirect("loginForm.do");
                return;
            }
            
            String loginIdStr = (String) session.getAttribute("loginId");
            if(loginIdStr == null) {
                response.sendRedirect("loginForm.do");
                return;
            }
            
            String reviewBoardIdStr = request.getParameter("id");
            if(reviewBoardIdStr == null) {
                response.sendRedirect("ReviewBoardList.ReviewBoardDo");
                return;
            }
            
            Long reviewBoardId = Long.parseLong(reviewBoardIdStr);
            
            System.out.println("삭제할 리뷰 ID: " + reviewBoardId);
            System.out.println("삭제 요청자 LoginId: " + loginIdStr);
            
            ReviewBoardDTO existingReview = dao.getReviewBoardById(reviewBoardId);
            
            if(existingReview == null) {
                System.out.println("해당 리뷰가 존재하지 않습니다.");
                response.sendRedirect("ReviewBoardList.ReviewBoardDo");
                return;
            }
            
            if(!existingReview.getLoginId().equals(loginIdStr)) {
                System.out.println("삭제 권한이 없습니다.");
                response.sendRedirect("ReviewBoardPost.ReviewBoardDo?id=" + reviewBoardId);
                return;
            }
            
            List<String> imageFileNames = dao.getImageFileNames(reviewBoardId);

            boolean success = dao.deleteReviewBoard(reviewBoardId, loginIdStr);
            
            if(success) {
                System.out.println("리뷰 삭제 완료");
                
                // 이미지 파일들 삭제
                String uploadDir = "/photo/review/";
                String realPath = request.getServletContext().getRealPath(uploadDir);
                for (String fileName : imageFileNames) {
                    File file = new File(realPath + fileName);
                    if (file.exists()) {
                        file.delete();
                        System.out.println("이미지 파일 삭제: " + fileName);
                    }
                }
                
                response.sendRedirect("ReviewBoardList.ReviewBoardDo");
            }
            
        } catch (Exception e) {
            System.out.println("리뷰 삭제 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }
	}

}
