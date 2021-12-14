package com.bitElectro.vo;

public class PeriodAmountVO {

String period, period_amount;
	
	
	public PeriodAmountVO(String period, String period_amount) {
		super();
		this.period = period;
		this.period_amount = period_amount;
	}
	

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getPeriod_amount() {
		return period_amount;
	}

	public void setPeriod_amount(String period_amount) {
		this.period_amount = period_amount;
	}


	@Override
	public String toString() {
		return "PeriodAmountVO [period=" + period + ", period_amount=" + period_amount + "]";
	}
	
	
}
