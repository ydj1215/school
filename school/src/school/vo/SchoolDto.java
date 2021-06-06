package school.vo;

public class SchoolDto {
	private String id;
	private String pId;
	private String pwd;
	private String title;
	private int count;
	
	public SchoolDto() {}
	public SchoolDto(String tid, String tTitle, int tCount)
	{
		this.id=tid;
		this.title=tTitle;
		this.count=tCount;
	}
	public SchoolDto(String tid, String pId, String tTitle, int tCount)
	{
		this.id=tid;
		this.pId =pId;
		this.title=tTitle;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String tTitle) {
		this.title= tTitle;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int tCount) {
		this.count = tCount;
	}
}
