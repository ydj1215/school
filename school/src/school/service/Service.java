package school.service;

import school.dao.SchoolDao;
import school.vo.SchoolDto;

public class Service {
	private static Service service = new Service();
	private Service() {}
	private SchoolDao dao = SchoolDao.getInstance();
	public static Service getInstance()
	{
		return service;
	}
	
	public boolean profLogin(String id, String pwd) {
		// TODO Auto-generated method stub
		return dao.profLogin(id, pwd);
	}
	
	public boolean studentLogin(String id, String pwd) {
		// TODO Auto-generated method stub
		return dao.studentLogin(id, pwd);
	}

	public void profEnrollSubject(SchoolDto subject) {
		// TODO Auto-generated method stub
		dao.profEnrollSubject(subject);
	}
}
