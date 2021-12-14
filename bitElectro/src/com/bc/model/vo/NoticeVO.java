package com.bc.model.vo;

import java.sql.Date;

public class NoticeVO {
	private String  mid, csubject, ccontent, cimage, ccategory, cstatus;
	
	private int cno, rnum, csecret;

	private Date crdate;
	
	public NoticeVO() {}

	public NoticeVO(String mid, String csubject, String ccontent, String cimage, String ccategory, String cstatus,
			int cno, int rnum, int csecret, Date crdate) {
		super();
		this.mid = mid;
		this.csubject = csubject;
		this.ccontent = ccontent;
		this.cimage = cimage;
		this.ccategory = ccategory;
		this.cstatus = cstatus;
		this.cno = cno;
		this.rnum = rnum;
		this.csecret = csecret;
		this.crdate = crdate;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getCsubject() {
		return csubject;
	}

	public void setCsubject(String csubject) {
		this.csubject = csubject;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getCimage() {
		return cimage;
	}

	public void setCimage(String cimage) {
		this.cimage = cimage;
	}

	public String getCcategory() {
		return ccategory;
	}

	public void setCcategory(String ccategory) {
		this.ccategory = ccategory;
	}

	public String getCstatus() {
		return cstatus;
	}

	public void setCstatus(String cstatus) {
		this.cstatus = cstatus;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getCsecret() {
		return csecret;
	}

	public void setCsecret(int csecret) {
		this.csecret = csecret;
	}

	public Date getCrdate() {
		return crdate;
	}

	public void setCrdate(Date crdate) {
		this.crdate = crdate;
	}

	@Override
	public String toString() {
		return "NoticeVO [mid=" + mid + ", csubject=" + csubject + ", ccontent=" + ccontent + ", cimage=" + cimage
				+ ", ccategory=" + ccategory + ", cstatus=" + cstatus + ", cno=" + cno + ", rnum=" + rnum + ", csecret="
				+ csecret + ", crdate=" + crdate + "]";
	}
	
}