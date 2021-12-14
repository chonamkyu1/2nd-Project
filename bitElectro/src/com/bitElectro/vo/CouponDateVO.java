package com.bitElectro.vo;

public class CouponDateVO {
String cnt, cordate;

public CouponDateVO(String cnt, String cordate) {
	super();
	this.cnt = cnt;
	this.cordate = cordate;
}

public CouponDateVO() {}

public String getCnt() {
	return cnt;
}

public void setCnt(String cnt) {
	this.cnt = cnt;
}

public String getCordate() {
	return cordate;
}

public void setCordate(String cordate) {
	this.cordate = cordate;
}

@Override
public String toString() {
	return "CouponDateVO [cnt=" + cnt + ", cordate=" + cordate + "]";
}



}
