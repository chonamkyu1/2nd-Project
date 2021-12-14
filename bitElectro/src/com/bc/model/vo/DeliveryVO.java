package com.bc.model.vo;

import java.sql.Date;

public class DeliveryVO {
	private int dno, dprice;
	private String dname, dphone, daddress, dclass;
	private Date privateDate;
	
	public DeliveryVO(int dno, int dprice, String dname, String dphone, String daddress, String dclass,
			Date privateDate) {
		super();
		this.dno = dno;
		this.dprice = dprice;
		this.dname = dname;
		this.dphone = dphone;
		this.daddress = daddress;
		this.dclass = dclass;
		this.privateDate = privateDate;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public int getDprice() {
		return dprice;
	}

	public void setDprice(int dprice) {
		this.dprice = dprice;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getDphone() {
		return dphone;
	}

	public void setDphone(String dphone) {
		this.dphone = dphone;
	}

	public String getDaddress() {
		return daddress;
	}

	public void setDaddress(String daddress) {
		this.daddress = daddress;
	}

	public String getDclass() {
		return dclass;
	}

	public void setDclass(String dclass) {
		this.dclass = dclass;
	}

	public Date getPrivateDate() {
		return privateDate;
	}

	public void setPrivateDate(Date privateDate) {
		this.privateDate = privateDate;
	}

	@Override
	public String toString() {
		return "DeliveryVO [dno=" + dno + ", dprice=" + dprice + ", dname=" + dname + ", dphone=" + dphone
				+ ", daddress=" + daddress + ", dclass=" + dclass + ", privateDate=" + privateDate + "]";
	}

}