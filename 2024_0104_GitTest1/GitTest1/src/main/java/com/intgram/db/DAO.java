package com.intgram.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.intgram.model.Co2VO;
import com.intgram.model.MemberVO;

public class DAO {

	// 연결객체를 빌려줄 수 있는 sqlSessionFactory 선언
	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public int join(MemberVO vo) {
		// 1. 연결객체 빌려오기
		SqlSession sqlsession = factory.openSession(true);

		// 2. 연결객체 사용하기
		// 아이디 중복확인 코드
		// 중복이 없네 -> 회원가입
		// values(?, ?, ?, ?)
		// row -> table에 영향을 받은 행의 개수
		int row = sqlsession.insert("join", vo);

		// 3. 연결객체 다시 반납하기
		sqlsession.close();

		// 4. 결과값 반환하기
		return row;
	}

	public MemberVO login(MemberVO vo) {
		// 1. 연결객체 빌려오기
		SqlSession sqlsession = factory.openSession(true);
		// 2. 연결객체 사용하기
		MemberVO result = sqlsession.selectOne("login", vo);

		// 3. 연결객체 다시 반납하기
		sqlsession.close();
		// 4. 결과값 반환하기
		return result;
	}

	public int insertC(Co2VO co2vo) {
		// TODO Auto-generated method stub
		SqlSession sqlsession = factory.openSession(true);
		
		System.out.println("abcd  " + (int)co2vo.getFuel_amount());
		int result = sqlsession.insert("insertC", co2vo);
		
		sqlsession.close();

		return result;
	}

	public List<Co2VO> getdata(MemberVO mvo) {
		// TODO Auto-generated method stub
		SqlSession sqlsession = factory.openSession(true);
		List<Co2VO> result = sqlsession.selectList("getdata", mvo);
		sqlsession.close();

		return result;
	}

}
