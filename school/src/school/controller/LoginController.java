package school.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import school.service.Service;

public class LoginController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String prof = request.getParameter("prof");
		String student = request.getParameter("student");
		
		Service s = Service.getInstance();
		String path = null;
		
		boolean pResult = s.profLogin(id,pwd);
		boolean sResult = s.studentLogin(id,pwd);
		
		if(student == null)
		{
			if(pResult)
			{
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				path = "/profMenu.jsp";
			}
			else
			{
				path = "/login.jsp";
			}
		}
		else
		{
			if(sResult)
			{
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				path = "/studentMenu.jsp";
			}
			else
			{
				path = "/login.jsp";
			}
		}
		
		HttpUtil.forward(request, response, path);
	}
}
