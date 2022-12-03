package vo;

public class WebtoonCommentsVO {

	int comments_idx, love, episode_idx, step; 
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getComments_idx() {
		return comments_idx;
	}
	public void setComments_idx(int comments_idx) {
		this.comments_idx = comments_idx;
	}
	public int getLove() {
		return love;
	}
	public void setLove(int love) {
		this.love = love;
	}
	public int getEpisode_idx() {
		return episode_idx;
	}
	public void setEpisode_idx(int episode_idx) {
		this.episode_idx = episode_idx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	String content, id;
	
	
	
	
}
