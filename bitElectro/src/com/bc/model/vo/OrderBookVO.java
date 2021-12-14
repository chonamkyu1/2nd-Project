package com.bc.model.vo;

import java.sql.Date;

public class OrderBookVO {
	private int ono;
	private String mid;
	private int dno;
	private Date odate;
	private int oamount;
	
	public OrderBookVO(int ono, String mid, int dno, Date odate, int oamount) {
		super();
		this.ono = ono;
		this.mid = mid;
		this.dno = dno;
		this.odate = odate;
		this.oamount = oamount;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
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
		return "OrderBookVO [ono=" + ono + ", mid=" + mid + ", dno=" + dno + ", odate=" + odate + ", oamount=" + oamount
				+ "]";
	}
	
}
