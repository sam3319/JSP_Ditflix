package service.ReviewBoard;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import DAO.ReviewBoard.ReviewBoardDAO;
import DTO.ReviewBoard.ReviewBoardDTO;

public class ReviewBoardInsertService implements ReviewBoardService {

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
            
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String category = request.getParameter("category");
            
            System.out.println("리뷰 작성 요청 - 제목: " + title + ", 카테고리: " + category);
            
            // 유효성 검사 하기
            if(title == null || title.trim().isEmpty() || 
               content == null || content.trim().isEmpty() ||
               category == null || category.trim().isEmpty()) {
                request.setAttribute("errorMessage", "모든 필드를 입력해주세요.");
                request.getRequestDispatcher("/WEB-INF/views/reviewboardDir/reviewboardWrite.jsp").forward(request, response);
                return;
            }
            
            ReviewBoardDTO review = new ReviewBoardDTO();
            review.setLoginId(loginIdStr);
            review.setTitle(title.trim());
            review.setContent(content.trim());
            review.setCategory(category);
            
            List<String> imageFileNames = new ArrayList<>();
            try {
                Collection<Part> parts = request.getParts();
                String uploadDir = "/photo/review/";
                String realPath = request.getServletContext().getRealPath(uploadDir);
                File uploadDirFile = new File(realPath);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                    System.out.println("업로드 디렉토리 생성: " + realPath);
                }
                
                for (Part part : parts) {
                    if ("images".equals(part.getName()) && part.getSize() > 0) {
                        String fileName =  part.getSubmittedFileName();
                        
                        String filePath = realPath + fileName;
                        part.write(filePath);
                        
                        imageFileNames.add(fileName);
                        System.out.println("이미지 저장 완료: " + fileName);
                    }
                }
            } catch (ServletException e) {
                System.out.println("이미지 처리 중 오류");
            }
            boolean success = dao.insertReviewBoard(review, imageFileNames);
            
            if(success) {
                System.out.println("리뷰 작성 완료");
                response.sendRedirect("ReviewBoardList.ReviewBoardDo");
            }else {
                System.out.println("리뷰 작성 실패");
            }
        } catch (Exception e) {
            System.out.println("리뷰 작성 중 오류 발생");
            e.printStackTrace();
        }
	}
}
