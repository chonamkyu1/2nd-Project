package com.bitElectro.vo;

public class OrderBookDetailVO {
	
	//기본 변수
	String odno, ono, pcode, cno, pcnt, pprice, odate, o_amount;
	
	
	///////////////////////////////////////////////////////////
	public OrderBookDetailVO () {}

	public OrderBookDetailVO(String odno, String ono, String pcode, String cno, String pcnt, String pprice,
			String odate, String o_amount) {
		super();
		this.odno = odno;
		this.ono = ono;
		this.pcode = pcode;
		this.cno = cno;
		this.pcnt = pcnt;
		this.pprice = pprice;
		this.odate = odate;
		this.o_amount = o_amount;
	}



	public String getPcnt() {
		return pcnt;
	}



	public void setPcnt(String pcnt) {
		this.pcnt = pcnt;
	}



	public String getOdno() {
		return odno;
	}

	public void setOdno(String odno) {
		this.odno = odno;
	}

	public String getOno() {
		return ono;
	}

	public void setOno(String ono) {
		this.ono = ono;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getPprice() {
		return pprice;
	}

	public void setPprice(String pprice) {
		this.pprice = pprice;
	}

	public String getOdate() {
		return odate;
	}

	public void setOdate(String odate) {
		this.odate = odate;
	}

	public String getO_amount() {
		return o_amount;
	}

	public void setO_amount(String o_amount) {
		this.o_amount = o_amount;
	}



	@Override
	public String toString() {
		return "OrderBookDetailVO [odno=" + odno + ", ono=" + ono + ", pcode=" + pcode + ", cno=" + cno + ", pcnt="
				+ pcnt + ", pprice=" + pprice + ", odate=" + odate + ", o_amount=" + o_amount + "]";
	}

	
	
	
	
	
}
