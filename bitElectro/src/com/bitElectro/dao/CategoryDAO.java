package com.bitElectro.dao;

import org.apache.ibatis.session.SqlSession;

import com.bitElectro.mybatis.DBService;
import com.bitElectro.vo.CategoryVO;

public class CategoryDAO {

	//CategoryVO 도출
	public static CategoryVO selectCT(CategoryVO cvo) {
		
		SqlSession ss = DBService.getFactory().openSession();
		CategoryVO cvoResult= ss.selectOne("project.selectCtOne",cvo);
		ss.close();
		return cvoResult;
	}
	
	//CNO로 CVO 찾기
	public static CategoryVO selectCategory(String cno) {
		
		SqlSession ss = DBService.getFactory().openSession();
		CategoryVO cvo = ss.selectOne("project.selectCateByNum",cno);
		
		return cvo;
	}
	
}
