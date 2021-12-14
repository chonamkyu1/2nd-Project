package com.bitElectro.vo;

public class CateProdVO {

	String pcode, pname, cno, pimage, cmain, cmiddle, csub, pprice, pstock, pregist;
	
	public CateProdVO() {}

	public CateProdVO(String pcode, String pname, String cno, String pimage, String cmain, String cmiddle, String csub,
			String pprice, String pstock, String pregist) {
		super();
		this.pcode = pcode;
		this.pname = pname;
		this.cno = cno;
		this.pimage = pimage;
		this.cmain = cmain;
		this.cmiddle = cmiddle;
		this.csub = csub;
		this.pprice = pprice;
		this.pstock = pstock;
		this.pregist = pregist;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public String getCmain() {
		return cmain;
	}

	public void setCmain(String cmain) {
		this.cmain = cmain;
	}

	public String getCmiddle() {
		return cmiddle;
	}

	public void setCmiddle(String cmiddle) {
		this.cmiddle = cmiddle;
	}

	public String getCsub() {
		return csub;
	}

	public void setCsub(String csub) {
		this.csub = csub;
	}

	public String getPprice() {
		return pprice;
	}

	public void setPprice(String pprice) {
		this.pprice = pprice;
	}

	public String getPstock() {
		return pstock;
	}

	public void setPstock(String pstock) {
		this.pstock = pstock;
	}

	public String getPregist() {
		return pregist;
	}

	public void setPregist(String pregist) {
		this.pregist = pregist;
	}

	@Override
	public String toString() {
		return "CateProdVO [pcode=" + pcode + ", pname=" + pname + ", cno=" + cno + ", pimage=" + pimage + ", cmain="
				+ cmain + ", cmiddle=" + cmiddle + ", csub=" + csub + ", pprice=" + pprice + ", pstock=" + pstock
				+ ", pregist=" + pregist + "]";
	}

	
	
	
	
	
}