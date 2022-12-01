package vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class EpisodeVO {
	int episode_idx,ref,score, step, readhit;
	String episodename,path,regdate,filename;
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	//사진을 받기위한 File 변수 선언
	private List<MultipartFile> photo;
	private MultipartFile thumbnail;
	
	public MultipartFile getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(MultipartFile thumbnail) {
		this.thumbnail = thumbnail;
	}

	public List<MultipartFile> getPhoto() {
		return photo;
	}
	public void setPhoto(List<MultipartFile> photo) {
		this.photo = photo;
	}
	public int getEpisode_idx() {
		return episode_idx;
	}
	public void setEpisode_idx(int episode_idx) {
		this.episode_idx = episode_idx;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getReadhit() {
		return readhit;
	}
	public void setReadhit(int readhit) {
		this.readhit = readhit;
	}
	public String getEpisodename() {
		return episodename;
	}
	public void setEpisodename(String episodename) {
		this.episodename = episodename;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}