package com.bitElectro.mybatis;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// myBatis ����ؼ� �۾��� SqlSession�� ����� ��
// SqlSessionFactory ��ü ������ ���� Ŭ����
public class DBService {

	//������ �޼ҵ带 �ܺο��� ����� �� �ֵ��� static���� ����
	private static SqlSessionFactory factory;
	
	//static �ʱ�ȭ��
	static {
		try {
			factory = new SqlSessionFactoryBuilder()
					.build(Resources.getResourceAsReader("com/bitElectro/mybatis/config.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		
		return factory;
	}
}
