package service.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.User.UsersDAO;
import DTO.User.UsersDTO;

public class UserDeleteService implements UserService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		String loginId = request.getParameter("loginId");
		
		UsersDAO dao = new UsersDAO();
		
		Boolean result = dao.userDelete(loginId);
		
		if(result) {			
			HttpSession session = request.getSession(false);
			
			if(session != null) {
				session.invalidate();
				
				System.out.println(loginId + "님 회원탈퇴 완료 및 세션 무효화");
				request.setAttribute("success", "회원탈퇴가 완료 되었습니다.");
				
				return;
			}else {
				System.out.println(loginId + "님 회원탈퇴 완료 및 세션 무효화");
				request.setAttribute("error", "회원탈퇴에 실패 했습니다.");
				
				return;
			}
		}

	}

}
