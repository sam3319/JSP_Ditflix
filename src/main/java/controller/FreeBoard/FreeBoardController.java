package controller.FreeBoard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FreeBoard.FreeBoardCommentDeleteService;
import service.FreeBoard.FreeBoardCommentInsertService;
import service.FreeBoard.FreeBoardDeleteService;
import service.FreeBoard.FreeBoardInsertService;
import service.FreeBoard.FreeBoardListService;
import service.FreeBoard.FreeBoardPostService;
import service.FreeBoard.FreeBoardService;
import service.FreeBoard.FreeBoardUpdateFormService;
import service.FreeBoard.FreeBoardUpdateService;


@WebServlet("*.FreeBoardDo")
public class FreeBoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".FreeBoardDo"));
		String viewPage = null;
		
		 
        // 자유게시판 목록 조회
        if(com != null && com.equals("FreeBoardList")) {
        	FreeBoardService service = new FreeBoardListService();
        	service.execute(request, response);
        	viewPage = "WEB-INF/views/freeboardDir/freeboard.jsp";
        }
        // 자유게시판 게시글 상세 조회        
        else if(com != null && com.equals("FreeBoardPost")) {
        	FreeBoardService service = new FreeBoardPostService();
            service.execute(request, response);
            viewPage = "/WEB-INF/views/freeboardDir/freeboardPost.jsp";
        }
		// 자유게시판 게시글 작성		
		else if(com != null && com.equals("FreeBoardWrite")) {
			viewPage = "WEB-INF/views/freeboardDir/freeboardWrite.jsp";
		}
		// 자유게시판 게시글 수정
		else if(com != null && com.equals("FreeBoardUpdateForm")) {
			FreeBoardService service = new FreeBoardUpdateFormService();
		    service.execute(request, response);
		    viewPage = "/WEB-INF/views/freeboardDir/freeboardEdit.jsp";
		}

		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".FreeBoardDo"));
		
		// 게시글 작성 처리
        if(com != null && com.equals("FreeBoardWrite")) {
            FreeBoardService service = new FreeBoardInsertService();
            service.execute(request, response);
        }
        // 게시글 수정 처리	
        else if(com != null && com.equals("FreeBoardUpdate")) {
            FreeBoardService service = new FreeBoardUpdateService();
            service.execute(request, response);
        }
        // 게시글 삭제 처리    
		else if(com != null && com.equals("FreeBoardDelete")) {
		    FreeBoardService service = new FreeBoardDeleteService();
		    service.execute(request, response);
		    return;
		}
        // 게시글 댓글 작성 처리
		else if(com != null && com.equals("FreeBoardCommentInsert")) {
		    FreeBoardService service = new FreeBoardCommentInsertService();
		    service.execute(request, response);
		    return;
		}
        // 게시판 댓글 삭제 처리
		else if(com != null && com.equals("FreeBoardCommentDelete")) {
		    FreeBoardService service = new FreeBoardCommentDeleteService();
		    service.execute(request, response);
		    return;
		}
	}

}
