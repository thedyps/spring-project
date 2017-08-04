package xyz.thedyps.main.svimpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xyz.thedyps.main.mem.AuthInfo;
import xyz.thedyps.main.mem.IdPasswordNotMatchingException;
import xyz.thedyps.main.mem.MemberVO;
import xyz.thedyps.main.svinterf.AuthService;

@Service
public class AuthServiceImpl implements AuthService {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public AuthInfo authenticate(String email, String password) {
		MemberVO member = sqlSession.selectOne("mem.selByEmail", email);
		if (member == null) {
			throw new IdPasswordNotMatchingException();
		}
		if (!member.matchPassword(password)) {
			throw new IdPasswordNotMatchingException();
		}
		return new AuthInfo(member.getId(), member.getEmail(), member.getName());
	}
}
