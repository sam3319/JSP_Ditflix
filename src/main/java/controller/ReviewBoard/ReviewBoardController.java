package controller.ReviewBoard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ReviewBoard.ReviewBoardDeleteService;
import service.ReviewBoard.ReviewBoardInsertService;
import service.ReviewBoard.ReviewBoardListService;
import service.ReviewBoard.ReviewBoardPostService;
import service.ReviewBoard.ReviewBoardService;
import service.ReviewBoard.ReviewBoardUpdateFormService;
import service.ReviewBoard.ReviewBoardUpdateService;

@MultipartConfig(
	    maxFileSize = 1024 * 1024 * 5,
	    maxRequestSize = 1024 * 1024 * 25,
	    fileSizeThreshold = 1024 * 1024 
	)
@WebServlet("*.ReviewBoardDo")
public class ReviewBoardController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String uri = request.getRequestURI();
        String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".ReviewBoardDo"));
        String viewPage = null;

        // 리뷰게시판 목록 조회
        if(com != null && com.equals("ReviewBoardList")) {
            ReviewBoardService service = new ReviewBoardListService();
            service.execute(request, response);
            viewPage = "WEB-INF/views/reviewboardDir/reviewboard.jsp";
        }
        
        // 리뷰게시판 상세 조회        
        else if(com != null && com.equals("ReviewBoardPost")) {
            ReviewBoardService service = new ReviewBoardPostService();
            service.execute(request, response);
            
            if(request.getAttribute("errorMessage") != null) {
                response.sendRedirect("ReviewBoardList.ReviewBoardDo");
                return;
            }
            
            viewPage = "WEB-INF/views/reviewboardDir/reviewboardPost.jsp";
        }
        
        // 리뷰게시판 작성 폼
        else if(com != null && com.equals("ReviewBoardWrite")) {
            viewPage = "WEB-INF/views/reviewboardDir/reviewboardWrite.jsp";
        }
        
        // 리뷰게시판 수정 폼
        else if(com != null && com.equals("ReviewBoardUpdateForm")) {
            ReviewBoardService service = new ReviewBoardUpdateFormService();
            service.execute(request, response);
            
            String redirectUrl = (String) request.getAttribute("redirectUrl");
            if(redirectUrl != null) {
                response.sendRedirect(redirectUrl);
                return;
            }
            
            viewPage = "WEB-INF/views/reviewboard/reviewEdit.jsp";
        }
        // 리뷰게시판 검색
        else if(com != null && com.equals("ReviewBoardSearch")) {
            ReviewBoardService service = new ReviewBoardListService();
            service.execute(request, response);
            viewPage = "WEB-INF/views/reviewboardDir/reviewList.jsp";
        }
       
        RequestDispatcher rd = request.getRequestDispatcher(viewPage);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
        String uri = request.getRequestURI();
        String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".ReviewBoardDo"));

        
        // 리뷰 작성 처리
        if(com != null && com.equals("ReviewBoardInsert")) {
            ReviewBoardService service = new ReviewBoardInsertService();
            service.execute(request, response);
            return;
        }
        // 리뷰 수정 처리    
        else if(com != null && com.equals("ReviewBoardUpdate")) {
            ReviewBoardService service = new ReviewBoardUpdateService();
            service.execute(request, response);
            return;
        }
        // 리뷰 삭제 처리
        else if(com != null && com.equals("ReviewBoardDelete")) {
            ReviewBoardService service = new ReviewBoardDeleteService();
            service.execute(request, response);
            return; 
        }
    }
}