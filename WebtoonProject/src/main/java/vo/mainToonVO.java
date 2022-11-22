package vo;

import org.springframework.web.multipart.MultipartFile;

public class mainToonVO {

	private int idx;
	private String name, content, pwd, ip, regdate, filename;
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
		// 파일을 받기 위한 클래스
		MultipartFile photo;
	
	public MultipartFile getPhoto() {
			return photo;
		}
		public void setPhoto(MultipartFile photo) {
			this.photo = photo;
		}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
