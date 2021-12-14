package com.bitElectro.vo;

public class CouponAllVO {

	String cono, mid, cname, cdisper, cdiscash, cordate, cvalidity;
	
	public CouponAllVO() {}
	
	public CouponAllVO(String cono, String mid, String cname, String cdisper, String cdiscash, String cordate,
			String cvalidity) {
		super();
		this.cono = cono;
		this.mid = mid;
		this.cname = cname;
		this.cdisper = cdisper;
		this.cdiscash = cdiscash;
		this.cordate = cordate;
		this.cvalidity = cvalidity;
	}

	public String getCono() {
		return cono;
	}

	public void setCono(String cono) {
		this.cono = cono;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCdisper() {
		return cdisper;
	}

	public void setCdisper(String cdisper) {
		this.cdisper = cdisper;
	}

	public String getCdiscash() {
		return cdiscash;
	}

	public void setCdiscash(String cdiscash) {
		this.cdiscash = cdiscash;
	}

	public String getCordate() {
		return cordate;
	}

	public void setCordate(String cordate) {
		this.cordate = cordate;
	}

	public String getCvalidity() {
		return cvalidity;
	}

	public void setCvalidity(String cvalidity) {
		this.cvalidity = cvalidity;
	}

	@Override
	public String toString() {
		return "CouponAllVO [cono=" + cono + ", mid=" + mid + ", cname=" + cname + ", cdisper=" + cdisper
				+ ", cdiscash=" + cdiscash + ", cordate=" + cordate + ", cvalidity=" + cvalidity + "]";
	}
	
	
}
