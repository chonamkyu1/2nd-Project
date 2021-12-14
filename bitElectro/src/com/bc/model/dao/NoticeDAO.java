package com.bc.model.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.NoticeVO;
import com.bc.mybatis.DBService;

public class NoticeDAO {
	
	//고객센터 전체 글의 전체 건수 조회
	public static int getTotalCount(int ccategory) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("bitElectro.noticeTotalCount", ccategory);
		ss.close();
		return totalCount;
	}

	//현재 페이지에 해당하는 글목록(게시글) 가져오기
	public static List<NoticeVO> getList(int begin, int end, int ccategory) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("num", ccategory);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<NoticeVO> list = ss.selectList("bitElectro.noticeboardlist", map);
		ss.close();
		return list;
	}
	
	//게시글 하나 조회
	public static NoticeVO selectOne(int ccategory, int rnum, int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("ccategory", ccategory);
		map.put("rnum", rnum);
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		NoticeVO vo = ss.selectOne("bitElectro.noticeBoardOne", map);
		ss.close();
		return vo;
	}
	
	// 고객이 1대1 문의글 insert
		public static void insertInquire(NoticeVO nvo) {
			
			SqlSession ss = DBService.getFactory().openSession(true);
			ss.insert("bitElectro.insertInquire", nvo);
			ss.close();
		}
		
		// 문의글 update 
		public static void updateInquire(NoticeVO nvo) {
			
			SqlSession ss = DBService.getFactory().openSession(true);
			ss.update("bitElectro.updateInquire", nvo);
			ss.close();
		}
		
		// 고객센터글 삭제
		public static void deleteNoticeOne(int cno) {
			
			SqlSession ss = DBService.getFactory().openSession(true);
			ss.delete("bitElectro.deleteNoticeOne", cno);
			ss.close();
		}
		
}
