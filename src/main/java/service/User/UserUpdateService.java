package service.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.User.UsersDAO;
import DTO.User.UsersDTO;

public class UserUpdateService implements UserService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String loginId = request.getParameter("loginId");
		String nickName = request.getParameter("nickName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		
		UsersDAO dao = new UsersDAO();
		
		Boolean result = dao.userUpdate(loginId, nickName, email, phone, password);
		
		if(result) {
			//	회원정보 가져오기			
			UsersDTO dto = dao.getUserInfo(loginId);
			
			
			if(dto != null) {
				//	수정된 회원정보 세션 수정				
				HttpSession session = request.getSession();
				
				session.setAttribute("loginUser", dto);
				session.setAttribute("loginId", dto.getLoginId());
				session.setAttribute("nickName", dto.getNickName());
				
				System.out.println(loginId + "회원정보 수정 완료");
				request.setAttribute("successMessage", "회원정보가 정상적으로 수정되었습니다.");
				
				return;
				
			}else {
				System.out.println(loginId + " 님의 회원정보 수정에 실패했습니다");
				request.setAttribute("errorMessage", "회원정보 수정에 실패했습니다.");
				
				return;
			}
			
		}

	}

}
