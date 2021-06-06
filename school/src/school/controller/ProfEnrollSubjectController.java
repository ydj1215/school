package school.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import school.vo.SchoolDto;
import school.service.Service;

public class ProfEnrollSubjectController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String pId = request.getParameter("pId");
		String title = request.getParameter("title");
		int count = Integer.parseInt(request.getParameter("count"));
		
		SchoolDto subject = new SchoolDto(id,pId,title,count);
		
		Service s = Service.getInstance();
		s.profEnrollSubject(subject);
		
		HttpUtil.forward(request, response, "/profMenu.jsp");
	}	
}
