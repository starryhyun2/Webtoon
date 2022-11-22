package vo;		//webtoon_user, webtoon, webtoonComments 3개의 vo들을 가질 패키지 

public class Webtoon_UserVO {	//webtoon_user 테이블의 getter, setter를 가지고 있는 vo

	private int user_idx, webtoon_idx;
	private String name, id, pwd, email;
	
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getWebtoon_idx() {
		return webtoon_idx;
	}
	public void setWebtoon_idx(int webtoon_idx) {
		this.webtoon_idx = webtoon_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}