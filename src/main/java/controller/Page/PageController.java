package controller.Page;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.do")
public class PageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".do"));
		String viewPage = null;
		
	 	// Index
		if (com != null && com.equals("index")) {
			HttpSession session = request.getSession(false);
			
			// 세션이 없는 경우
		    if(session == null) {
		        response.sendRedirect("memberShip.do");
		        return;
		    }
		    
		    // 세션은 있지만 로그인 정보가 없는 경우
		    String loginId = (String) session.getAttribute("loginId");
		    if(loginId == null) {
		        response.sendRedirect("memberShip.do");
		        return;
		    }	
		    
		    System.out.println(loginId + "님 메인페이지에 접근");
		    viewPage = "WEB-INF/views/index.jsp";	
		}
		// 회원가입 Form
		else if (com != null && com.equals("joinForm")) {
			viewPage = "WEB-INF/views/joinForm.jsp";
		}
		// 로그인 Form
		else if(com != null && com.equals("loginForm")) {
			viewPage = "WEB-INF/views/loginForm.jsp";
		}
		// 마이페이지
		else if(com != null && com.equals("myPage")) {
			HttpSession session = request.getSession(false);
					
			// session 에 데이터가 없을 경우 로그인 페이지로 이동 시킨다.		
			if(session == null) {
				response.sendRedirect("loginForm.do");
				return;
			}
					
			String loginId = (String) session.getAttribute("loginId");
					
			// session 에 로그인 정보가 있는지 한번 더 확인 하고 없을 경우 로그인 페이지로 이동 시킨다.		
			if(loginId == null) {
				response.sendRedirect("loginForm.do");
				return;
			}
			viewPage = "WEB-INF/views/myPage.jsp";
		}
		// 멤버쉼 소개
		else if(com != null && com.equals("memberShip")) {
			viewPage = "WEB-INF/views/memberShip.jsp";
		}
		// 검색 페이지
		else if(com != null && com.equals("search")) {
			viewPage = "WEB-INF/views/search.jsp";
		}
		// 리뷰 게시판
		else if(com != null && com.equals("reviewBoard")) {
			response.sendRedirect("ReviewBoardList.ReviewBoardDo");
			return;
		}
		// 자유 게시판
		else if(com != null && com.equals("freeBoard")) {
			response.sendRedirect("FreeBoardList.FreeBoardDo");
			return;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
