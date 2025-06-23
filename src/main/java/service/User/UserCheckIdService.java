package service.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.User.UsersDAO;

public class UserCheckIdService implements UserService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String loginId = request.getParameter("loginId");
		try {
			if (loginId == null && loginId.isEmpty()) {
				// 	loginId 가 없을 경우 JS객체 형태로 클라이언트 측에 응답				
				response.getWriter().write("{\"isDuplicate\": false, \"message\": \"아이디를 입력해주세요.\"}");
				return;
			}
			UsersDAO dao = new UsersDAO();
			boolean isDuplicate = dao.isLoginIdExists(loginId);
			
			String json = String.format("{\"isDuplicate\": %b, \"message\": \"%s\"}", isDuplicate, isDuplicate ? "이미 사용 중인 아이디입니다." : "사용 가능한 아이디입니다.");
			response.getWriter().write(json);
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

}
