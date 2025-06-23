package service.User;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.User.UserHistoryDAO;
import DAO.User.UsersDAO;
import DTO.User.UserHistoryDTO;
import DTO.User.UsersDTO;

public class UserLoginService implements UserService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");
		String rememberLogin = request.getParameter("rememberLogin");
		
		UsersDAO dao = new UsersDAO();
		UsersDTO dto = dao.userLogin(loginId, password);
		
		// 로그인에 성공한 경우 
		if(dto != null) {
			System.out.println(loginId + "님 로그인 성공: ");
			
			//	세션에 로그인 정보 저장			
			HttpSession session = request.getSession();
			
			session.setAttribute("loginUser", dto);
			session.setAttribute("loginId", dto.getLoginId());
			session.setAttribute("nickName", dto.getNickName());
			
			//	쿠키 생성
//			if("on".equals(rememberLogin)) {
//				Cookie cookie = new Cookie();
//				cookie.setMaxAge(60 * 60 * 24 * 30);
//				response.addCookie(cookie);
//			}
			UserHistoryDAO historyDAO = new UserHistoryDAO();
			
			String ipAdd = request.getRemoteAddr();
            String userAgent = request.getHeader("User-Agent");
			
			UserHistoryDTO historyDTO = new UserHistoryDTO(dto.getLoginId(), ipAdd, userAgent);
			
			historyDAO.insertHistory(historyDTO);
			
			request.setAttribute("result", "success");
		}else {
			//	로그인에 실패한 경우			
			System.out.println("로그인 실패");
			request.setAttribute("errorMessage", "아이디 또는 비밀번호가 올바르지 않습니다.");
			request.setAttribute("loginId", loginId);
		}
	}



}
