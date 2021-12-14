package com.bc.model.vo;

public class MemberVO {

	String mid; //유저아이디
	String mpw; //비밀번호
	String mname; //유저이름
	String mphone; //전화번호
	String maddress; //주소
	String mjumin; //생일
	String memail; //이메일
	String mpoint; //포인트
	String mcumulative_buy; //누적구매액
	String mjoindate; //가입일
	String mclass; //고객등급

	public MemberVO () {}

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

	public String getMpoint() {
		return mpoint;
	}

	public void setMpoint(String mpoint) {
		this.mpoint = mpoint;
	}

	public String getMcumulative_buy() {
		return mcumulative_buy;
	}

	public void setMcumulative_buy(String mcumulative_buy) {
		this.mcumulative_buy = mcumulative_buy;
	}

	public String getMjoindate() {
		return mjoindate;
	}

	public void setMjoindate(String mjoindate) {
		this.mjoindate = mjoindate;
	}

	public String getMclass() {
		return mclass;
	}

	public void setMclass(String mclass) {
		this.mclass = mclass;
	}

	public MemberVO(String mid, String mpw, String mname, String mphone, String maddress, String mjumin, String memail,
			String mpoint, String mcumulative_buy, String mjoindate, String mclass) {
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

	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mphone=" + mphone + ", maddress="
				+ maddress + ", mjumin=" + mjumin + ", memail=" + memail + ", mpoint=" + mpoint + ", mcumulative_buy="
				+ mcumulative_buy + ", mjoindate=" + mjoindate + ", mclass=" + mclass + "]";
	}
}