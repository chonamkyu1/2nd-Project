package com.bc.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.LogInVO;
import com.bc.mybatis.DBService;

public class LogInDAO {

	// 전체리스트
	public static List<LogInVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<LogInVO> list = ss.selectList("bitElectro.list");
		ss.close();
		return list;
	}

	//  로그인
	public static LogInVO logIn(LogInVO logInvo) {
		SqlSession ss = DBService.getFactory().openSession();
		logInvo = ss.selectOne("bitElectro.logIn", logInvo);
		ss.close();
		return logInvo;
	}

	// 아이디찾기
	public static LogInVO findId(String mname, String mphone) {
		Map<String, String> map = new HashMap<>();
		map.put("mname", mname);
		map.put("mphone", mphone);
		SqlSession ss = DBService.getFactory().openSession();
		LogInVO findIdvo = ss.selectOne("bitElectro.findId", map);
		ss.close();
		return findIdvo;

	}

	// 비밀번호 찾기
	public static LogInVO findPassword(String mid, String mname, String mphone) {
		Map<String, String> map = new HashMap<>();
		map.put("mid", mid);
		map.put("mname", mname);
		map.put("mphone", mphone);
		SqlSession ss = DBService.getFactory().openSession();
		LogInVO findPWvo = ss.selectOne("bitElectro.findPassword", map);
		ss.close();
		return findPWvo;
	}

	// 로그인 map 으로 한번 해보기
	public static List<LogInVO> logInMap(String idx, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		SqlSession ss = DBService.getFactory().openSession();
		List<LogInVO> list = ss.selectList("bitElectro.logInMap", map);
		ss.close();
		return list;

	}
	
	// 회원가입 
	public static int insert(LogInVO insertvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("bitElectro.joinMemberShip", insertvo);
		ss.close();
		return result;
	}
	
	// 비빌번호 재설정
	public static int updatePW(LogInVO updatevo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("bitElectro.updatePassword", updatevo);
		ss.close();
		return result;
	}
	
	// 내정보 수정
	public static int memberUpdate(LogInVO updatevo) {
		SqlSession ss= DBService.getFactory().openSession(true);
		int result = ss.update("bitElectro.updateMember", updatevo);
		ss.close();
		return result;
	}

	
	// 회원 탈퇴
	public static int deleteMember(LogInVO deletevo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("bitElectro.deleteMember", deletevo);
		ss.close();
		return result;
	}
	
	// 아이디 중복확인
	public static int idCheck(String mid) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("bitElectro.idCheck", mid);
		ss.close();
		return result;
		
	}	
}
