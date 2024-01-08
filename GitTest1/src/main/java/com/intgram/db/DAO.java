package com.intgram.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.intgram.model.Co2VO;
import com.intgram.model.MemberVO;

public class DAO {

	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public int join(MemberVO vo) {
		SqlSession sqlsession = factory.openSession(true);
		int row = sqlsession.insert("join", vo);
		sqlsession.close();
		return row;
	}

	public MemberVO login(MemberVO vo) {
		SqlSession sqlsession = factory.openSession(true);
		MemberVO result = sqlsession.selectOne("login", vo);
		sqlsession.close();
		return result;
	}

	public int insertC(Co2VO co2vo) {
		SqlSession sqlsession = factory.openSession(true);
		System.out.println("abcd  " + (int) co2vo.getFuel_amount());
		int result = sqlsession.insert("insertC", co2vo);
		sqlsession.close();
		return result;
	}

	public List<Co2VO> getdata(MemberVO mvo) {
		SqlSession sqlsession = factory.openSession(true);
		List<Co2VO> result = sqlsession.selectList("getdata", mvo);
		sqlsession.close();
		return result;
	}

}
