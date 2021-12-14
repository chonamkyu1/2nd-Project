package com.bitElectro.vo;

public class ProductVO {

	String pcode, cno, pname, pprice, pimage, pstock, pdescription, pdiscount, pregist, pcumulative_sales, preating,
			preview_count;

	public ProductVO(String pcode, String cno, String pname, String pprice, String pimage, String pstock,
			String pdescription, String pdiscount, String pregist, String pcumulative_sales, String preating,
			String preview_count) {
		super();
		this.pcode = pcode;
		this.cno = cno;
		this.pname = pname;
		this.pprice = pprice;
		this.pimage = pimage;
		this.pstock = pstock;
		this.pdescription = pdescription;
		this.pdiscount = pdiscount;
		this.pregist = pregist;
		this.pcumulative_sales = pcumulative_sales;
		this.preating = preating;
		this.preview_count = preview_count;
	}

	public ProductVO() {
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

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPprice() {
		return pprice;
	}

	public void setPprice(String pprice) {
		this.pprice = pprice;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public String getPstock() {
		return pstock;
	}

	public void setPstock(String pstock) {
		this.pstock = pstock;
	}

	public String getPdescription() {
		return pdescription;
	}

	public void setPdescription(String pdescription) {
		this.pdescription = pdescription;
	}

	public String getPdiscount() {
		return pdiscount;
	}

	public void setPdiscount(String pdiscount) {
		this.pdiscount = pdiscount;
	}

	public String getPregist() {
		return pregist;
	}

	public void setPregist(String pregist) {
		this.pregist = pregist;
	}

	public String getPcumulative_sales() {
		return pcumulative_sales;
	}

	public void setPcumulative_sales(String pcumulative_sales) {
		this.pcumulative_sales = pcumulative_sales;
	}

	public String getPreating() {
		return preating;
	}

	public void setPreating(String preating) {
		this.preating = preating;
	}

	public String getPreview_count() {
		return preview_count;
	}

	public void setPreview_count(String preview_count) {
		this.preview_count = preview_count;
	}

	@Override
	public String toString() {
		return "ProductVO [pcode=" + pcode + ", cno=" + cno + ", pname=" + pname + ", pprice=" + pprice + ", pimage="
				+ pimage + ", pstock=" + pstock + ", pdescription=" + pdescription + ", pdiscount=" + pdiscount
				+ ", pregist=" + pregist + ", pcumulative_sales=" + pcumulative_sales + ", preating=" + preating
				+ ", preview_count=" + preview_count + "]";
	}

}
