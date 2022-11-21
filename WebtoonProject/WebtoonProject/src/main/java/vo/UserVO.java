package vo;

public class UserVO {
	
	@Override
	public String toString() {
		return "UserVO [USER_IDX=" + USER_IDX + ", WEBTOON_IDX=" + WEBTOON_IDX + ", NAME=" + NAME + ", ID=" + ID
				+ ", PWD=" + PWD + ", EMAIL=" + EMAIL + "]";
	}
	
	//USER_IDX
	private String USER_IDX;
	//WEBTOON_IDX
	private String WEBTOON_IDX;
	//NAME 회원 이름
	private String NAME;
	//ID  회원 아이디
	private String ID;
	//PWD 회원 비밀번호
	private String PWD;
	//EMAIL	회원 이메일
	private String EMAIL;
	
	public String getUSER_IDX() {
		return USER_IDX;
	}
	
	
	public void setUSER_IDX(String uSER_IDX) {
		USER_IDX = uSER_IDX;
	}
	public String getWEBTOON_IDX() {
		return WEBTOON_IDX;
	}
	public void setWEBTOON_IDX(String wEBTOON_IDX) {
		WEBTOON_IDX = wEBTOON_IDX;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPWD() {
		return PWD;
	}
	public void setPWD(String pWD) {
		PWD = pWD;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	
}
