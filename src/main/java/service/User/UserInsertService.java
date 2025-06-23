package service.User;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.User.UsersDAO;
import DTO.User.UsersDTO;

public class UserInsertService implements UserService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String loginId = request.getParameter("loginId");
		String nickName = request.getParameter("nickName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        
        UsersDTO dto = new UsersDTO(loginId, nickName, email, phone, password, gender);
        UsersDAO dao = new UsersDAO();
        
        boolean result = dao.userInsert(dto);
        
        if(result) {
        	request.setAttribute("joinSuccess", "회원가입이 완료 되었습니다. 로그인 해주세요.");
        }else {
        	request.setAttribute("joinError", "회원가입에 실패 했습니다. 다시 시도해주세요.");
        }  
	}

}
