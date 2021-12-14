package com.bc.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.CartVO;
import com.bc.mybatis.DBService;

public class CartDAO {
	
	// 장바구니 리스트 가져오기
	public static List<CartVO> cartSelectList(String mid) {
		SqlSession ss = DBService.getFactory().openSession();
		List<CartVO> cvo = ss.selectList("bitElectro.cartSelectList", mid);
		ss.close();
		return cvo;
	}
	
	// 장바구니 하나 삭제하기
	public static void cartDeleteOne(String cnto, String mid) {
		Map<String, String> map = new HashMap<>();
		map.put("cnto", cnto);
		map.put("mid", mid);
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("bitElectro.cartDeleteOne", map);
		ss.close();
	}
	
	public static void cartNumUpdate(String pcnt, String cnto, String mid) {
		Map<String, String> map = new HashMap<>();
		map.put("pcnt", pcnt);
		map.put("cnto", cnto);
		map.put("mid", mid);
		
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("bitElectro.cartNumUpdate", map);
		ss.close();
	}
	
	public static void insertCart(CartVO cvo) {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("bitElectro.insertCart",cvo);
		ss.close();
	}

}
