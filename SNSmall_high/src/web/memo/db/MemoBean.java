package web.memo.db;

import java.sql.Date;

public class MemoBean {

		private int num;
		private String from_id;
		private String to_id;
		private String subject;
		private String content;
		private Date date;
		
		public int getNum() {
			return num;
		}
		public void setNum(int num) {
			this.num = num;
		}
		public String getFrom_id() {
			return from_id;
		}
		public void setFrom_id(String from_id) {
			this.from_id = from_id;
		}
		public String getTo_id() {
			return to_id;
		}
		public void setTo_id(String to_id) {
			this.to_id = to_id;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		
}
