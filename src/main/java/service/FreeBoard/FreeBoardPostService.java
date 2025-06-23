package service.FreeBoard;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.FreeBoard.FreeBoardCommentDAO;
import DAO.FreeBoard.FreeBoardDAO;
import DTO.FreeBoard.FreeBoardCommentDTO;
import DTO.FreeBoard.FreeBoardDTO;

public class FreeBoardPostService implements FreeBoardService {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        FreeBoardDAO dao = new FreeBoardDAO();
        FreeBoardCommentDAO commentDao = new FreeBoardCommentDAO();
        
        try {
            String boardIdStr = request.getParameter("id");
            
            if(boardIdStr == null) {
                System.out.println("게시글 ID가 없습니다.");
                response.sendRedirect("FreeBoardList.FreeBoardDo");
                return;
            }
            
            Long boardId = Long.parseLong(boardIdStr);
            System.out.println("조회할 게시글 ID: " + boardId);
            
            FreeBoardDTO board = dao.getFreeBoardPost(boardId);
            
            if(board == null) {
                System.out.println("해당 게시글이 존재하지 않습니다.");
                response.sendRedirect("FreeBoardList.FreeBoardDo");
                return;
            }
            
            // 조회수 증가 메소드 실행
            dao.updateViewCount(boardId);
            
            List<FreeBoardCommentDTO> comments = commentDao.getCommentsByBoardId(boardId);
            
            int commentCount = commentDao.getCommentCount(boardId); // 댓글 수
            
            request.setAttribute("board", board);
            request.setAttribute("comments", comments);
            request.setAttribute("commentCount", commentCount);
            request.setAttribute("board", board);
            
            return;     
        }
        catch (Exception e) {
            System.out.println("게시글 상세 조회 중 오류 발생");
            e.printStackTrace();
        }
    }
}
