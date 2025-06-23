package controller.User;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.User.UserCheckIdService;
import service.User.UserDeleteService;
import service.User.UserInsertService;
import service.User.UserLoginService;
import service.User.UserLogoutService;
import service.User.UserService;
import service.User.UserUpdateService;


@WebServlet("*.UserDo")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".UserDo"));
		
		// 아이디 중복검사	
		if(com != null && com.equals("checkId")){
			UserService service = new UserCheckIdService();
			service.execute(request, response);
			return;
		}
		// 로그아웃		
		else if(com != null && com.equals("logout")) {
			UserService service = new UserLogoutService();
			service.execute(request, response);
			return;
		}
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".UserDo"));
		String viewPage = null;
				
		// 회원가입		
		if (com != null && com.equals("insert")) {
			System.out.println("회원가입 시도");
			UserService service = new UserInsertService();
			service.execute(request, response);
			viewPage = "WEB-INF/views/loginForm.jsp";
		}
		// 로그인
		else if(com != null && com.equals("login")) {
			System.out.println("로그인 시도");
			UserService service = new UserLoginService();
			service.execute(request, response);
			
			String result = (String) request.getAttribute("result");
			
			if("success".equals(result)) {
				// 로그인 성공 시 메인화면으로 이동
				response.sendRedirect("index.do");
				return;
			}else {
				// 로그인 실패 시 돌아오기				
				viewPage = "WEB-INF/views/loginForm.jsp";
			}
		}
		// 회원탈퇴
		else if(com != null && com.equals("delete")) {
			System.out.println("회원탈퇴 시도");
			UserService service = new UserDeleteService();
			service.execute(request, response);
			
			String result = (String) request.getAttribute("success");
			
			if(result != null) {
				// 탈퇴 성공 시 메인화면으로 이동
				System.out.println(request.getAttribute("success"));
				response.sendRedirect("index.do");
				return;
			}else {
				// 탈퇴 실패 시 다시 돌아오기				
				System.out.println(request.getAttribute("error"));
				viewPage = "WEB-INF/views/myPage.jsp";
			}
			
		}
		// 회원정보수정
		else if(com != null && com.equals("update")) {
			System.out.println("회원정보수정 시도");
			UserService service = new UserUpdateService();
			service.execute(request, response);
			viewPage = "WEB-INF/views/myPage.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
	}

}
