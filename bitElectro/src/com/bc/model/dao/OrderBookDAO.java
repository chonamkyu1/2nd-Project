package com.bc.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.OrderBookVO;
import com.bc.mybatis.DBService;

public class OrderBookDAO {
	
	//주문번호 조회
		public static OrderBookVO orderBookSearch(String mid, String mjumin) {
			Map<String, String> map = new HashMap<>();
			map.put("mid", mid);
			map.put("mjumin", mjumin);
			
			SqlSession ss = DBService.getFactory().openSession();
			OrderBookVO vo = ss.selectOne("bitElectro.orderBookSearch", map);
			ss.close();
			return vo;
		}

}
