package com.bc.model.vo;

public class OrderDetailVO {
	private int odno, ono, cno, pcnt, pprice;
	private String pcode, pstatus;
	
	public OrderDetailVO(int odno, int ono, int cno, int pcnt, int pprice, String pcode, String pstatus) {
		super();
		this.odno = odno;
		this.ono = ono;
		this.cno = cno;
		this.pcnt = pcnt;
		this.pprice = pprice;
		this.pcode = pcode;
		this.pstatus = pstatus;
	}

	public int getOdno() {
		return odno;
	}

	public void setOdno(int odno) {
		this.odno = odno;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getPcnt() {
		return pcnt;
	}

	public void setPcnt(int pcnt) {
		this.pcnt = pcnt;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	@Override
	public String toString() {
		return "OrderDetailVO [odno=" + odno + ", ono=" + ono + ", cno=" + cno + ", pcnt=" + pcnt + ", pprice=" + pprice
				+ ", pcode=" + pcode + ", pstatus=" + pstatus + "]";
	}
	
}
