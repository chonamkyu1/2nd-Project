package com.bitElectro.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bitElectro.mybatis.DBService;
import com.bitElectro.vo.OrderBookDetailVO;
import com.bitElectro.vo.PeriodAmountVO;

public class OrderBookDetailDAO {

	
	public static List<OrderBookDetailVO> monthlyAmount(){
		
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderBookDetailVO>list =  ss.selectList("currMothlyList");
		ss.close();
		return list;
	}

	public static List<PeriodAmountVO> getYearAmount() {
		
		SqlSession ss = DBService.getFactory().openSession();
		List<PeriodAmountVO> list = ss.selectList("project.selectYearAmount");
		ss.close();
		return list;
	}

	public static List<PeriodAmountVO> getMonthAmount(String year) {
		SqlSession ss = DBService.getFactory().openSession();
		List<PeriodAmountVO> list = ss.selectList("project.selectMonthAmount",year);
		ss.close();
		return list;
	}

	public static List<PeriodAmountVO> getDateAmount(String month) {
		SqlSession ss = DBService.getFactory().openSession();
		List<PeriodAmountVO> list = ss.selectList("project.selectDateAmount",month);
		ss.close();
		return list;
	}

}
