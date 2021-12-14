package com.bitElectro.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bitElectro.mybatis.DBService;
import com.bitElectro.vo.MemberVO;

public class MemberDAO {

	/////////////////////////////////////////////////////
	//관리자 정보 불러오기
	public static List<MemberVO> getList() {
		// DB에서 데이터 불러오기
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("project.selectAdminAll");
		ss.close();
		return list;
	}

	// mid와 mpw로 정보가 로그인 맞는지 확인
	public static boolean validateUser(String mid, String mpw) {

		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("project.selectAdminAll");
		ss.close();
		for (MemberVO mvo : list) {
			
			if (mvo.getMid().equals(mid)) { // 아이디 확인
				if (mvo.getMpw().equals(mpw)) {// 비밀번호 확인
					if(Integer.parseInt(mvo.getMclass())<2){
					return true;
					}
				}
			}
		}
		return false;
	}

	// mid로 관리자 한명의 정보
	public static MemberVO getUserInfo(String mid) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO mvo = ss.selectOne("project.selectAdminId", mid);
		ss.close();
		return mvo;
	}
	
	// vo로 정보 Insert
	public static void insertAdmin(MemberVO mvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("project.insertAdmin", mvo);
		ss.close();
	}
	
	//DB에서 관리자만 불러오기
	public static List<MemberVO> adminList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list =  ss.selectList("project.adminList");
		ss.close();
		return list;
	}
	
	//DB에서 관리자만 이름으로 불러오기
	public static List<MemberVO> adminNameList(String mname){
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list =  ss.selectList("project.selectListByName",mname);
		ss.close();
		return list;
	}
	
	//ID로 관리자 리스트 불러오기
	public static List<MemberVO> adminIdList(String mid){
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list =  ss.selectList("project.selectAdminId",mid);
		ss.close();
		return list;
	}
	//관리자 내용 업데이트
	public static void updateAdmin(MemberVO mvo) {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("project.updateAdmin",mvo);
		ss.close();
	}
	//관리자 삭제
	public static void deleteAdmin(String mid) {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("project.deleteAdmin",mid);
		ss.close();
	}
	
	/////////////////////////////////////////////////
	//유저정보 관련 DAO
	
	//유저 리스트 불러오기
	public static List<MemberVO> custList(){
		
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("project.selectCustList");
		ss.close();
		return list;
	}
	
	//이름으로 고객리스트 찾기
	public static List<MemberVO> custNameList(String mname){
		
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO>list =  ss.selectList("project.selectCustListByName",mname);
		ss.close();
		return list;
	}
	
	//ID로 고객 한명의 정보를 찾기
	public static MemberVO getCustInfo(String mid) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO mvo = ss.selectOne("project.selectOneCustId", mid);
		ss.close();
		return mvo;
	}
	
	
	//ID로 고객 리스트 불러오기
		public static List<MemberVO> custIdList(String mid){
			SqlSession ss = DBService.getFactory().openSession();
			List<MemberVO> list =  ss.selectList("project.selectCustId",mid);
			ss.close();
			return list;
		}
		
	//누적구매금액으로 고객 찾기
	public static List<MemberVO> getCustListByCumul(String cumulative_buy) {
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list =  ss.selectList("project.selectByCumul",cumulative_buy);
		ss.close();
		return list;
		}	
		
		
	//고객정보 내용 업데이트
	public static void updateCust(MemberVO mvo) {
			
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("project.updateCust",mvo);
		ss.close();
	}
	
	//고객정보 삭제
	public static void deleteCust(String mid) {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("project.deleteCustById",mid);
		ss.close();
	}



}
