package com.bitElectro.vo;

public class CouponVO {
String cnt, mid, cordate, cname, cdisper, cdiscash, cvalidity;

public CouponVO() {}

public CouponVO(String cnt, String mid, String cordate, String cname, String cdisper, String cdiscash,
		String cvalidity) {
	super();
	this.cnt = cnt;
	this.mid = mid;
	this.cordate = cordate;
	this.cname = cname;
	this.cdisper = cdisper;
	this.cdiscash = cdiscash;
	this.cvalidity = cvalidity;
}

public String getCnt() {
	return cnt;
}

public void setCnt(String cnt) {
	this.cnt = cnt;
}

public String getMid() {
	return mid;
}

public void setMid(String mid) {
	this.mid = mid;
}

public String getCordate() {
	return cordate;
}

public void setCordate(String cordate) {
	this.cordate = cordate;
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

public String getCvalidity() {
	return cvalidity;
}

public void setCvalidity(String cvalidity) {
	this.cvalidity = cvalidity;
}

@Override
public String toString() {
	return "CouponVO [cnt=" + cnt + ", mid=" + mid + ", cordate=" + cordate + ", cname=" + cname + ", cdisper="
			+ cdisper + ", cdiscash=" + cdiscash + ", cvalidity=" + cvalidity + "]";
}



}
