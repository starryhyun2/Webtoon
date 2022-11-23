package vo;

import org.springframework.web.multipart.MultipartFile;

public class mainToonVO {

	private int webtoon_idx, author_idx;
	private String title, author, genre, regdate, filename, info;
	
	public int getWebtoon_idx() {
		return webtoon_idx;
	}
	public void setWebtoon_idx(int webtoon_idx) {
		this.webtoon_idx = webtoon_idx;
	}
	public int getAuthor_idx() {
		return author_idx;
	}
	public void setAuthor_idx(int author_idx) {
		this.author_idx = author_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
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
	
}
