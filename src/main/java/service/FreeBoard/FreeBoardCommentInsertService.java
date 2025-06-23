package service.FreeBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.FreeBoard.FreeBoardCommentDAO;
import DTO.FreeBoard.FreeBoardCommentDTO;

public class FreeBoardCommentInsertService implements FreeBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			FreeBoardCommentDAO dao = new FreeBoardCommentDAO();
        
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

            String freeBoardIdStr = request.getParameter("freeBoardId");
            String content = request.getParameter("content");
            
            if(freeBoardIdStr == null || content == null || content.trim().isEmpty()) {
                response.sendRedirect("FreeBoardPost.FreeBoardDo?id=" + freeBoardIdStr);
                return;
            }
            
            Long freeBoardId = Long.parseLong(freeBoardIdStr);
            
            FreeBoardCommentDTO comment = new FreeBoardCommentDTO();
            comment.setFreeBoardId(freeBoardId);
            comment.setLoginId(loginIdStr);
            comment.setContent(content.trim());
              
            // 댓글 저장 하기
            boolean success = dao.insertComment(comment);
            
            if(success) {
                System.out.println("댓글 작성 완료");
            } else {
                System.out.println("댓글 작성 실패");
            }
            
            response.sendRedirect("FreeBoardPost.FreeBoardDo?id=" + freeBoardId);
        } catch (Exception e) {
            System.out.println("댓글 작성 중 오류 발생");
            e.printStackTrace();
        }

	}

}
