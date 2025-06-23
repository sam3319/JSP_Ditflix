package service.FreeBoard;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.FreeBoard.FreeBoardDAO;
import DTO.FreeBoard.FreeBoardDTO;

public class FreeBoardUpdateService implements FreeBoardService {

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
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String category = request.getParameter("category");
            
            if(freeBoardIdStr == null) {
                response.sendRedirect("FreeBoardList.FreeBoardDo");
                return;
            }
            
            Long freeBoardId = Long.parseLong(freeBoardIdStr);
            
            FreeBoardDTO existingBoard = dao.getFreeBoardPost(freeBoardId);
            if(existingBoard == null) {
                System.out.println("해당 게시글이 존재하지 않습니다.");
                response.sendRedirect("FreeBoardList.FreeBoardDo");
                return;
            }
            
            if(!existingBoard.getLoginId().equals(loginIdStr)) {
                request.setAttribute("errorMessage", "수정 권한이 없습니다.");
                response.sendRedirect("FreeBoardPost.FreeBoardDo?id=" + freeBoardId);
                return;
            }
            
            // 유효성 검사 실행
            if(title == null || title.trim().isEmpty() || 
               content == null || content.trim().isEmpty()) {
                request.setAttribute("errorMessage", "제목과 내용을 입력해주세요.");
                request.setAttribute("board", existingBoard);
                request.getRequestDispatcher("/WEB-INF/views/freeboardDir/freeboardEdit.jsp")
                       .forward(request, response);
                return;
            }
            
            FreeBoardDTO dto = new FreeBoardDTO();
            dto.setFreeBoardId(freeBoardId);
            dto.setLoginId(loginIdStr);
            dto.setTitle(title.trim());
            dto.setContent(content.trim());
            dto.setCategory(category);
            
            // 게시글 수정 메소드 실행
            boolean success = dao.updateFreeBoard(dto);
            
            if(success) {
                System.out.println("게시글 수정 완료");
                response.sendRedirect("FreeBoardPost.FreeBoardDo?id=" + freeBoardId);
            } else {
                System.out.println("게시글 수정 실패");
                request.setAttribute("errorMessage", "게시글 수정에 실패했습니다.");
                request.setAttribute("board", existingBoard);
                // 수정에 실패할 경우              
                request.getRequestDispatcher("/WEB-INF/views/freeboardDir/freeboardEdit.jsp")
                       .forward(request, response);
            }
            
        } catch (Exception e) {
            System.out.println("게시글 수정 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
