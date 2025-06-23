package service.FreeBoard;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.FreeBoard.FreeBoardCommentDAO;

public class FreeBoardCommentDeleteService implements FreeBoardService {

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
            
            String commentIdStr = request.getParameter("commentId");
            String freeBoardIdStr = request.getParameter("freeBoardId");
            
            if(commentIdStr == null || freeBoardIdStr == null) {
                response.sendRedirect("FreeBoardList.FreeBoardDo");
                return;
            }
            
            Long commentId = Long.parseLong(commentIdStr);
            Long freeBoardId = Long.parseLong(freeBoardIdStr);
            
            boolean success = dao.deleteComment(commentId, loginIdStr);
            
            if(success) {
                System.out.println("댓글 삭제 완료");
            } else {
                System.out.println("댓글 삭제 실패");
            }
            
            response.sendRedirect("FreeBoardPost.FreeBoardDo?id=" + freeBoardId);
            
        } catch (Exception e) {
            System.out.println("댓글 삭제 중 오류 발생");
            e.printStackTrace();
        }
    }
}
