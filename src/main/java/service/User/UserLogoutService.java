package service.User;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserLogoutService implements UserService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("로그아웃 시작");
		try {
			// session 객체 생성	
			HttpSession session = request.getSession();
			
			if(session != null) {
				session.invalidate(); // session 객체에 저장된 데이터 삭제 = 로그아웃
				
				String loginId = (String)session.getAttribute("loginId");
				System.out.println("아이디: " + loginId + "로그아웃");
				
				response.sendRedirect("index.do");
			}
		}
		catch(Exception e) {
			System.out.print("로그아웃 중 오류 발생");
			try {
				response.sendRedirect("index.do");
			} catch (IOException ee) {
				ee.printStackTrace();
			}
			e.printStackTrace();
			
		}

	}

}
