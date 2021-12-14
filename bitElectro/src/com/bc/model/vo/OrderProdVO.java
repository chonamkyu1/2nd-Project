package com.bc.model.vo;

// payment 주문상품 내역 
public class OrderProdVO {
	
	private String pname, pcnt, realprice, finalprice;

	public OrderProdVO() {}

	public OrderProdVO(String pname, String pcnt, String realprice, String finalprice) {
		super();
		this.pname = pname;
		this.pcnt = pcnt;
		this.realprice = realprice;
		this.finalprice = finalprice;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPcnt() {
		return pcnt;
	}

	public void setPcnt(String pcnt) {
		this.pcnt = pcnt;
	}

	public String getRealprice() {
		return realprice;
	}

	public void setRealprice(String realprice) {
		this.realprice = realprice;
	}

	public String getFinalprice() {
		return finalprice;
	}

	public void setFinalprice(String finalprice) {
		this.finalprice = finalprice;
	}

	@Override
	public String toString() {
		return "OrderProdVO [pname=" + pname + ", pcnt=" + pcnt + ", realprice=" + realprice + ", finalprice="
				+ finalprice + "]";
	}
}
