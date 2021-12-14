package com.bitElectro.dao;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bitElectro.mybatis.DBService;
import com.bitElectro.vo.CateProdVO;
import com.bitElectro.vo.CategoryVO;
import com.bitElectro.vo.ProductVO;

public class ProductDAO {
	
	//////////////////////////////////////////////////////////
	//IP값 가져오기
	public static String getIp() {
		String result = null;
		try {
			result = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			result = "";
		}
		return result;
	}
	//////////////////////////////////////////////////////////
	//SELECT 
	
	//상품리스트 불러오기
	public static List<ProductVO> getProdList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductVO> list = ss.selectList("project.selectProdAll");
		ss.close();
		return list;
	}
	
	//단일 상품 불러오기
	public static ProductVO selectProd(String pcode) {
		SqlSession ss = DBService.getFactory().openSession();
		ProductVO pvo =  ss.selectOne("project.selectProd",pcode);
		ss.close();
		return pvo;
	}
	
	//단일 상품 불러오기(이름)
	public static ProductVO selectProdByName(String pname) {
		SqlSession ss = DBService.getFactory().openSession();
		ProductVO pvo =  ss.selectOne("project.selectProdNyPname",pname);
		ss.close();
		return pvo;
	}
	
	
	//카테고리와 상품 정보 불러오기
	public static List<CateProdVO> getCateProdList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<CateProdVO>list = ss.selectList("project.selectCpList");
		return list;
	}
	
	public static List<CateProdVO> getProdListByCmain(String cmain){
		SqlSession ss = DBService.getFactory().openSession();
		List<CateProdVO>list = ss.selectList("project.selectCpListByCmain",cmain);
		return list;
	}
	

	//키워드로 카테고리 X 제품 리스트 찾기
	public static List<CateProdVO> getListByKey(String keyword) {
		
		SqlSession ss = DBService.getFactory().openSession();
		List<CateProdVO>list = ss.selectList("project.selectKeyList",keyword);
		ss.close();
		return list;
	}
	
	//카테고리 분류로 카테고리 X 제품 리스트 찾기
	public static List<CateProdVO> getListByCate(CategoryVO cvo){
		SqlSession ss = DBService.getFactory().openSession();
		List<CateProdVO> list = ss.selectList("project.selectCateList",cvo);
		ss.close();
		return list;
	}
	
	///////////////////////////////////////////////////////////
	//INSERT
	// 상품 Insert
	public static void insertProd(ProductVO pvo) {

		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("project.insertProd", pvo);
		ss.close();
	}
	
	///////////////////////////////////////////////////////////
	//Update
	// 상품 썸네일 이미지만 Update
	
	public static void updateF_name(ProductVO pvo) {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("project.updatePimage",pvo);
		ss.close();
	}
	// 상품 상세 이미지만 Update
	public static void updateFd_name(ProductVO pvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("project.updatePdesc",pvo);
		ss.close();
	}
	// 이미지를 제외한 나머지 항목 업데이트
	public static void updateProd(ProductVO pvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("project.updateProd",pvo);
		ss.close();
	}
	////////////////////////////////////////////////
	// 상품 삭제
	
	public static void deleteProd(String pcode) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("project.deleteProd",pcode);
		ss.close();
	}
	////////////////////////////////////////////////////////////////

	//상품 가격높은순
	public static List<ProductVO> getProdhigh(String pprice) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductVO> hprice = ss.selectList("project.highPriceAll", pprice);
		ss.close();
		return hprice;
	}
	//상품 가격낮은순
	public static List<ProductVO> getProdrow(String pprice) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductVO> rprice = ss.selectList("project.rowPriceAll", pprice);
		ss.close();
		return rprice;
	}
	
	//베스트 100(누적판매량)
	public static List<ProductVO> getProdSal(String pcumulative_sales){
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductVO> cumsal = ss.selectList("project.selectProdSal", pcumulative_sales);
		ss.close();
		return cumsal;
	}
	
	// 상품평점순
	public static List<ProductVO> getreathigh(String preating) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductVO> reat = ss.selectList("project.reatPrice", preating);
		ss.close();
		return reat;
	}
	
	//TOP4
	public static List<ProductVO> getTopSalFour(){
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductVO> topsal = ss.selectList("project.topSalFour");
		ss.close();
		return topsal;
	}
	
	//전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("project.totalCount");
		ss.close();
		return totalCount;
	}
	
	//현재 페이지에 해당하는 상품리스트(상품) 가져오기
	public static List<ProductVO> getList(int begin, int end){
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductVO> list = ss.selectList("project.list", map);
		ss.close();
		return list;
	}
	
	
	
}
