package school.vo;

public class SchoolDto {
	private String id;
	private String pId;
	private String pwd;
	private String name;
	private int count;
	
	public SchoolDto() {}
	public SchoolDto(String tid, String tName, int tCount)
	{
		this.id=tid;
		this.name=tName;
		this.count=tCount;
	}
	public SchoolDto(String tid, String pId, String tName, int tCount)
	{
		this.id=tid;
		this.pId =pId;
		this.name=tName;
		this.count=tCount;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String tId) {
		this.id = tId;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String tPwd) {
		this.pwd = tPwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String tName) {
		this.name= tName;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int tCount) {
		this.count = tCount;
	}
}
