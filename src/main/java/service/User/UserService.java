package service.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserService {
	public void execute(HttpServletRequest request, HttpServletResponse response);
}
