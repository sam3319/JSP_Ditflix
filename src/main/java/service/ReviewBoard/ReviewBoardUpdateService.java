package service.ReviewBoard;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import DAO.ReviewBoard.ReviewBoardDAO;
import DTO.ReviewBoard.ReviewBoardDTO;

public class ReviewBoardUpdateService implements ReviewBoardService {

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
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String category = request.getParameter("category");
            
            if(reviewBoardIdStr == null) {
                response.sendRedirect("ReviewBoardList.ReviewBoardDo");
                return;
            }
            
            Long reviewBoardId = Long.parseLong(reviewBoardIdStr);
            
            ReviewBoardDTO existingReview = dao.getReviewBoardById(reviewBoardId);
            if(existingReview == null) {
                System.out.println("해당 리뷰가 존재하지 않습니다.");
                response.sendRedirect("ReviewBoardList.ReviewBoardDo");
                return;
            }
            
            if(!existingReview.getLoginId().equals(loginIdStr)) {
                System.out.println("수정 권한이 없습니다.");
                response.sendRedirect("ReviewBoardPost.ReviewBoardDo?id=" + reviewBoardId);
                return;
            }
            
            // 유효성 검사 하기
            if(title == null || title.trim().isEmpty() || 
               content == null || content.trim().isEmpty() ||
               category == null || category.trim().isEmpty()) {
                request.setAttribute("errorMessage", "모든 필드를 입력해주세요.");
                request.setAttribute("review", existingReview);
                request.getRequestDispatcher("/WEB-INF/views/reviewboard/reviewEdit.jsp")
                       .forward(request, response);
                return;
            }
            
            ReviewBoardDTO review = new ReviewBoardDTO();
            review.setReviewBoardId(reviewBoardId);
            review.setLoginId(loginIdStr);
            review.setTitle(title.trim());
            review.setContent(content.trim());
            review.setCategory(category);
            
            List<String> newImageFileNames = new ArrayList<>();
            boolean hasNewImages = false;
            
            try {
                Collection<Part> parts = request.getParts();
                String uploadDir = "/photo/review/";
                String realPath = request.getServletContext().getRealPath(uploadDir);
                File uploadDirFile = new File(realPath);
                
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                }
                
                for (Part part : parts) {
                    if ("images".equals(part.getName()) && part.getSize() > 0) {
                        hasNewImages = true;
                        
                        String fileName = part.getSubmittedFileName();
                        
                        String filePath = realPath + fileName;
                        part.write(filePath);
                        
                        newImageFileNames.add(fileName);
                        System.out.println("새 이미지 저장 완료: " + fileName);
                    }
                }
            } catch (Exception e) {
                System.out.println("이미지 처리 중 오류: " + e.getMessage());
            }
            
            List<String> oldImageFileNames = null;
            if (hasNewImages) {
                oldImageFileNames = dao.getImageFileNames(reviewBoardId);
            }
            
            boolean success = dao.updateReviewBoardWithImages(review, newImageFileNames, hasNewImages);
            
            if(success) {
                System.out.println("리뷰 수정 완료");
                
                // 기존 이미지 파일 삭제 (새 이미지가 있는 경우)
                if (hasNewImages && oldImageFileNames != null) {
                    String realPath = request.getServletContext().getRealPath("/photo/review/");
                    for (String oldFileName : oldImageFileNames) {
                        File file = new File(realPath + oldFileName);
                        if (file.exists()) {
                            file.delete();
                            System.out.println("기존 이미지 파일 삭제: " + oldFileName);
                        }
                    }
                }
                response.sendRedirect("ReviewBoardPost.ReviewBoardDo?id=" + reviewBoardId);
            }      
        } catch (Exception e) {
            System.out.println("리뷰 수정 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
