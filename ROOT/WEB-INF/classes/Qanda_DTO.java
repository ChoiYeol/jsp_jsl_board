package dto;

public class Qanda_DTO {

	String Qna_no ,Title, Content,Reg_id,	Qna_date,Reply,Reply_id,Reply_date, Checked_answer;

	public Qanda_DTO(){};
	
	public Qanda_DTO(String Qna_no ,String Title , String Content,String Reg_id,	
		String Qna_date,String Reply ,String Reply_id,String Reply_date, 
		String Checked_answer)
	{
		this.Qna_no  = Qna_no;
		this.Title   = Title;
		this.Content =Content;
		this.Reg_id  =Reg_id ;
		this.Qna_date=Qna_date;
		this.Reply   =Reply;
		this.Reply_id=Reply_id;
		this.Reply_date=Reply_date;
		this.Checked_answer=Checked_answer;
	}
	public String getQna_no() {
		return Qna_no;
	}

	public void setQna_no(String qna_no) {
		Qna_no = qna_no;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public String getReg_id() {
		return Reg_id;
	}

	public void setReg_id(String reg_id) {
		Reg_id = reg_id;
	}

	public String getQna_date() {
		return Qna_date;
	}

	public void setQna_date(String qna_date) {
		Qna_date = qna_date;
	}

	public String getReply() {
		return Reply;
	}

	public void setReply(String reply) {
		Reply = reply;
	}

	public String getReply_id() {
		return Reply_id;
	}
	public void setReply_id(String reply_id) {
		Reply_id = reply_id;
	}
	public String getReply_date() {
		return Reply_date;
	}

	public void setReply_date(String reply_date) {
		Reply_date = reply_date;
	}

	public String getChecked_answer() {
		return Checked_answer;
	}

	public void setChecked_answer(String checked_answer) {
		Checked_answer = checked_answer;
	}	
	
}
