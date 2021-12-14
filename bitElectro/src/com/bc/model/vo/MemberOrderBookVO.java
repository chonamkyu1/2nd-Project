package com.bc.model.vo;

import java.sql.Date;

public class MemberOrderBookVO {

	private String mid;
	private String mname;
	private String mphone;
	private String maddress;
	private String mjumin; 
	private String memail; 
	private String ono;
	private Date odate;
	private int oamount;
	
	public MemberOrderBookVO(String mid, String mname, String mphone, String maddress, String mjumin, String memail,
			String ono, Date odate, int oamount) {
		super();
		this.mid = mid;
		this.mname = mname;
		this.mphone = mphone;
		this.maddress = maddress;
		this.mjumin = mjumin;
		this.memail = memail;
		this.ono = ono;
		this.odate = odate;
		this.oamount = oamount;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
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

	public String getOno() {
		return ono;
	}

	public void setOno(String ono) {
		this.ono = ono;
	}

	public Date getOdate() {
		return odate;
	}

	public void setOdate(Date odate) {
		this.odate = odate;
	}

	public int getOamount() {
		return oamount;
	}

	public void setOamount(int oamount) {
		this.oamount = oamount;
	}

	@Override
	public String toString() {
		return "MemberOrderBookVO [mid=" + mid + ", mname=" + mname + ", mphone=" + mphone + ", maddress=" + maddress
				+ ", mjumin=" + mjumin + ", memail=" + memail + ", ono=" + ono + ", odate=" + odate + ", oamount="
				+ oamount + "]";
	}

}
