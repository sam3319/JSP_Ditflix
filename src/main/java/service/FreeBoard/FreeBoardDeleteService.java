package service.FreeBoard;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.FreeBoard.FreeBoardDAO;
import DTO.FreeBoard.FreeBoardDTO;

public class FreeBoardDeleteService implements FreeBoardService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        FreeBoardDAO dao = new FreeBoardDAO();
        
        try {
            HttpSession session = request.getSession(false);
            if(session == null) {
                System.out.println("세션이 없습니다.");
                response.sendRedirect("loginForm.do");
                return;
            }
            
            String loginIdStr = (String) session.getAttribute("loginId");
            if(loginIdStr == null) {
                System.out.println("로그인 정보가 없습니다.");
                response.sendRedirect("loginForm.do");
                return;
            }
            
            String freeBoardIdStr = request.getParameter("id");
            if(freeBoardIdStr == null) {
                System.out.println("게시글 ID가 없습니다.");
                response.sendRedirect("FreeBoardList.FreeBoardDo");
                return;
            }
            
            Long freeBoardId = Long.parseLong(freeBoardIdStr);
            
            System.out.println("삭제할 게시글 ID: " + freeBoardId);
            System.out.println("삭제 요청자 LoginId: " + loginIdStr);
            
            // 기존 게시글 조회 하기
            FreeBoardDTO existingBoard = dao.getFreeBoardPost(freeBoardId);
            if(existingBoard == null) {
                System.out.println("해당 게시글이 존재하지 않습니다.");
                response.sendRedirect("FreeBoardList.FreeBoardDo");
                return;
            }
            
            // 권한 확인 하기
            if(!existingBoard.getLoginId().equals(loginIdStr)) {
                System.out.println("삭제 권한이 없습니다. 작성자: " + existingBoard.getLoginId() + ", 요청자: " + loginIdStr);
                response.sendRedirect("FreeBoardPost.FreeBoardDo?id=" + freeBoardId);
                return;
            }
            
            // 게시글 삭제
            boolean success = dao.deleteFreeBoard(freeBoardId, loginIdStr);
            
            if(success) {
                System.out.println("게시글 삭제 완료");
                response.sendRedirect("FreeBoardList.FreeBoardDo");
            } else {
                System.out.println("게시글 삭제 실패");
                response.sendRedirect("FreeBoardPost.FreeBoardDo?id=" + freeBoardId);
            }
            
        }catch (Exception e) {
            System.out.println("게시글 삭제 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
