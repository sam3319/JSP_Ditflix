package service.Content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ContentService {
	public void execute(HttpServletRequest request, HttpServletResponse response);
}
