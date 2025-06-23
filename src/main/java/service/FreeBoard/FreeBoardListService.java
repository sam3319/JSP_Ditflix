package service.FreeBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.FreeBoard.FreeBoardDAO;
import DTO.FreeBoard.FreeBoardDTO;
import DTO.FreeBoard.PageDTO;

public class FreeBoardListService implements FreeBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		FreeBoardDAO dao = new FreeBoardDAO();
		
		int page = Integer.parseInt(request.getParameter("page") != null ? request.getParameter("page") : "1");
		
		String searchKeyword = request.getParameter("searchKeyword");
		String searchType = request.getParameter("searchType");
		
		long totalElements = dao.getFreeBoardCount(searchKeyword, searchType); // 총 게시글 수를 저장
		int pageSize = 10; // 한 페이지 당 10개의 게시글 출력
		
		
		PageDTO pageDTO = new PageDTO(page, pageSize, totalElements);
		
		List<FreeBoardDTO> dtos = dao.getFreeBoardList(pageDTO.getOffset(), pageSize, searchKeyword, searchType);
		
		// 각 데이터들을 클라이언트 쪽으로 전달한다.	
		request.setAttribute("boardList", dtos);
		request.setAttribute("pageInfo", pageDTO);
		request.setAttribute("searchKeyword", searchKeyword);
		request.setAttribute("searchType", searchType);
	}
}
