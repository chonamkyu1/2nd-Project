package com.bc.model.vo;

import java.sql.Date;

public class LogInVO {
	private String mid; // 아이디
	private String mpw; // 비밀번호
	private String mname; // 이름
	private String mphone; // 전화번호
	private String maddress; // 주소
	private String mjumin; // 생일
	private String memail; // 이메일
	private int mpoint; // 회원포인트
	private int mcumulative_buy; // 누적구매금액
	private String mjoindate; // 가입일
	private int mclass; // 회원구분

	public LogInVO() {
	}
	
	public LogInVO(String mid, String mpw) {
		this.mid = mid;
		this.mpw = mpw;
	}

	public LogInVO(String mid, String mpw, String mname, String mphone, String maddress, String mjumin, String memail,
			int mpoint, int mcumulative_buy, String mjoindate, int mclass) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mphone = mphone;
		this.maddress = maddress;
		this.mjumin = mjumin;
		this.memail = memail;
		this.mpoint = mpoint;
		this.mcumulative_buy = mcumulative_buy;
		this.mjoindate = mjoindate;
		this.mclass = mclass;

	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public String getMaddress() {
		return maddress;
	}

	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}

	public String getMjumin() {
		return mjumin;
	}

	public void setMjumin(String mjumin) {
		this.mjumin = mjumin;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public int getMpoint() {
		return mpoint;
	}

	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}

	public int getMcumulative_buy() {
		return mcumulative_buy;
	}

	public void setMcumulative_buy(int mcumulative_buy) {
		this.mcumulative_buy = mcumulative_buy;
	}

	public String getMjoindate() {
		return mjoindate;
	}

	public void setMjoindate(String mjoindate) {
		this.mjoindate = mjoindate;
	}

	public int getMclass() {
		return mclass;
	}

	public void setMclass(int mclass) {
		this.mclass = mclass;
	}

	@Override
	public String toString() {
		return "LogInVO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mphone=" + mphone + ", maddress="
				+ maddress + ", mjumin=" + mjumin + ", memail=" + memail + ", mpoint=" + mpoint + ", mcumulative_buy="
				+ mcumulative_buy + ", mjoindate=" + mjoindate + ", mclass=" + mclass + "]";
	}
	
	
} 
