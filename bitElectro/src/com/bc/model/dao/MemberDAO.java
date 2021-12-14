package com.bc.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.MemberVO;
import com.bc.mybatis.DBService;

public class MemberDAO {
//	---------------- 회원 ----------------------
	// mid로 한명의 정보 확인
		public static MemberVO getMemberUserInfo(String mid) {
			SqlSession ss = DBService.getFactory().openSession();
			MemberVO mvo = ss.selectOne("bitElectro.selectMemberOne", mid);
			ss.close();
			return mvo;
		}
		
//	// 문의하기 글쓰기에서 회원정보 3가지로 회원 or 비회원 확인 <- 나중에 구현
//			public static MemberVO getMemberUserInfo(String mname, String memail, String phone) {
//				Map<String, String> map = new HashMap<>();
//				map.put("mname", mname);
//				map.put("memail", memail);
//				map.put("phone", phone);
//				
//				SqlSession ss = DBService.getFactory().openSession();
//				MemberVO mvo = ss.selectOne("bitElectro.selectMemberOne", map);
//				ss.close();
//				return mvo;
//			}
		
	// 문의하기 글쓰기 중 비회원이 글쓸 때 정보 추가하기 
			
//			public static MemberVO insertNonMember(MemberVO mvo) {
//				SqlSession ss = DBService.getFactory().openSession();
//				MemberVO mvo1 = ss.selectOne("bitElectro.InsertNonMember", mvo);
//				ss.close();
//				return mvo;
//			}
			
// 문의하기 글쓰기 중 회원이 글쓸 때 정보 추가하기 
			
			public static MemberVO insertMember(MemberVO vo) {
				SqlSession ss = DBService.getFactory().openSession();
				MemberVO mvo = ss.selectOne("bitElectro.insertMember", vo);
				ss.close();
				return mvo;
			}
			
//	---------------- 관리자 ---------------------

	public static List<MemberVO> getList() {
		// DB에서 데이터 불러오기
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("bitElectro.selectAdminAll");
		ss.close();
		return list;
	}

	// mid와 mpw로 정보가 로그인 맞는지 확인
	public static boolean validateUser(String mid, String mpw) {

		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("bitElectro.selectAdminAll");
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

	// mid로 한명의 정보
	public static MemberVO getUserInfo(String mid) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO mvo = ss.selectOne("bitElectro.selectAdminOne", mid);
		ss.close();
		return mvo;
	}
	
	// vo로 정보 Insert
	public static void insertAdmin(MemberVO mvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("bitElectro.insertAdmin", mvo);
		ss.close();
	}
	
	//DB에서 관리자만 불러오기
	public static List<MemberVO> adminList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list =  ss.selectList("bitElectro.adminList");
		ss.close();
		return list;
	}
	
	//DB에서 관리자만 이름으로 불러오기
	public static List<MemberVO> adminNameList(String mname){
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list =  ss.selectList("bitElectro.selectListByName",mname);
		ss.close();
		return list;
	}
	
	//ID로 관리자 리스트 불러오기
	public static List<MemberVO> adminIdList(String mid){
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list =  ss.selectList("bitElectro.selectAdminOne",mid);
		ss.close();
		return list;
	}
	
	public static void updateAdmin(MemberVO mvo) {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("bitElectro.updateAdmin",mvo);
		ss.close();
	}
	
	public static void deleteAdmin(String mid) {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("bitElectro.deleteAdmin",mid);
		ss.close();
	}
}