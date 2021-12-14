package com.bitElectro.dao;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.bitElectro.mybatis.DBService;
import com.bitElectro.vo.CouponVO;

public class CouponDAO {

	
	public static List<CouponVO> getCouponList(){ //전체리스트 확인
		SqlSession ss = DBService.getFactory().openSession();
		List<CouponVO> list =  ss.selectList("project.selectCouponList");
		ss.close();
		return list;
	}
	

	public static List<CouponVO> getCouponAllList(String keyword) { //검색으로 쿠폰 찾기
		SqlSession ss = DBService.getFactory().openSession();
		List<CouponVO> list =  ss.selectList("project.selectAllCouplist",keyword);
		ss.close();
		return list;
	}

	public static void insertCoupon(CouponVO cavo) { //쿠폰 등록하기
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("project.insertCoupon",cavo);
		ss.close();
	}
	
}
