package service.FreeBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.FreeBoard.FreeBoardDAO;
import DTO.FreeBoard.FreeBoardDTO;

public class FreeBoardInsertService implements FreeBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		FreeBoardDAO dao = new FreeBoardDAO();
		try {
			HttpSession session = request.getSession(false);
			
			if(session == null) {
				response.sendRedirect("loginForm.do");
				return;
			}
			
			String loginStr = (String)session.getAttribute("loginId");
		
			if(loginStr == null) {
				response.sendRedirect("loginForm.do");
				return;
			}
			
			String title = request.getParameter("title");
			String category = request.getParameter("category");
			String content = request.getParameter("content");
			
			// 유효성 검사
            if(title == null || title.trim().isEmpty() || 
               content == null || content.trim().isEmpty()) {
                request.setAttribute("errorMessage", "제목과 내용을 입력해주세요.");
                request.getRequestDispatcher("/WEB-INF/views/freeboard/write.jsp").forward(request, response);
                return;
            }
            
            FreeBoardDTO dto = new FreeBoardDTO();
            
            dto.setLoginId(loginStr);
            dto.setTitle(title.trim());
            dto.setCategory(category != null ? category : "일반");
            dto.setContent(content.trim());
            
            // 게시글 작성
            boolean result = dao.insertFreeBoard(dto);
            
            if(result) {
            	System.out.println("게시글 작성 성공");
            	response.sendRedirect("FreeBoardList.FreeBoardDo");
            }else {
            	request.setAttribute("errorMessage", "게시글 작성에 실패했습니다.");
                request.getRequestDispatcher("/WEB-INF/views/freeboardDir/freeboardWrite.jsp").forward(request, response);
            }
		}
		catch(Exception e) {
			System.out.println("게시글 작성 서비스 오류 발생");
			e.printStackTrace();
		}

	}

}
