package com.bc.model.vo;

public class CartVO {
	private String pcode, mid, cnto, cno, pcnt;
	
	public CartVO() {}
	
	public CartVO(String cnto, String pcnt) {
		this.cnto = cnto;
		this.pcnt = pcnt;
	}

	public CartVO(String pcode, String mid, String cnto, String cno, String pcnt) {
		super();
		this.pcode = pcode;
		this.mid = mid;
		this.cnto = cnto;
		this.cno = cno;
		this.pcnt = pcnt;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getCnto() {
		return cnto;
	}

	public void setCnto(String cnto) {
		this.cnto = cnto;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getPcnt() {
		return pcnt;
	}

	public void setPcnt(String pcnt) {
		this.pcnt = pcnt;
	}

	@Override
	public String toString() {
		return "CartVO [pcode=" + pcode + ", mid=" + mid + ", cnto=" + cnto + ", cno=" + cno + ", pcnt=" + pcnt + "]";
	};
	
	
}