package dto;

public class News_DTO {
	String News_no, title, content , reg_id,reg_date;
	int hit;
	public News_DTO(){}
	public News_DTO(String News_no, 
						String title, 
						String content, 
						String reg_id,
						String reg_date,
						int hit){
		this.News_no 	= News_no;	
		this.title 		= title;
		this.content 	= content;
		this.reg_id 	= reg_id;
		this.reg_date 	= reg_date;
		this.hit 		= hit;
	}
	public String getNews_no() {
		return News_no;
	}
	public void setNews_no(String News_no) {
		this.News_no = News_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
}
