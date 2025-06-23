package service.FreeBoard;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.FreeBoard.FreeBoardDAO;
import DTO.FreeBoard.FreeBoardDTO;

public class FreeBoardUpdateFormService implements FreeBoardService {

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
            
            String boardIdStr = request.getParameter("id");
            if(boardIdStr == null) {
                System.out.println("게시글 ID가 없습니다.");
                response.sendRedirect("FreeBoardList.FreeBoardDo");
                return;
            }
            
            Long boardId = Long.parseLong(boardIdStr);
            System.out.println("수정 폼 로드할 게시글 ID: " + boardId);
            
            // 게시글 조회 하기
            FreeBoardDTO board = dao.getFreeBoardPost(boardId);
            
            if(board == null) {
                System.out.println("해당 게시글이 존재하지 않습니다.");
                response.sendRedirect("FreeBoardList.FreeBoardDo");
                return;
            }
            
            if(!board.getLoginId().equals(loginIdStr)) {
                response.sendRedirect("FreeBoardPost.FreeBoardDo?id=" + boardId);
                return;
            }
            
            request.setAttribute("board", board);       
        } 
        catch (Exception e) {
            System.out.println("수정 폼 로드 중 오류 발생");
            e.printStackTrace();
        }
    }
}
