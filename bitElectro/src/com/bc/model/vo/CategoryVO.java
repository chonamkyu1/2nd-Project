package com.bc.model.vo;

public class CategoryVO {

	
	String cno	,cmain	,cmiddle ,csub;
	//기본 생성자
	public CategoryVO(String cno, String cmain, String cmiddle, String csub) {
		super();
		this.cno = cno;
		this.cmain = cmain;
		this.cmiddle = cmiddle;
		this.csub = csub;
	}
	//카테고리 값만 가지고 cno를 찾기 위함.
	public CategoryVO(String cmain, String cmiddle, String csub) {
		super();
		this.cmain = cmain;
		this.cmiddle = cmiddle;
		this.csub = csub;
	}
	//값이 빈 생성자
	public CategoryVO() {}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
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

	@Override
	public String toString() {
		return "CategoryVO [cno=" + cno + ", cmain=" + cmain + ", cmiddle=" + cmiddle + ", csub=" + csub + "]";
	}
	
	
	
}

