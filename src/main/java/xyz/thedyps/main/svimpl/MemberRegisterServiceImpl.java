package xyz.thedyps.main.svimpl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xyz.thedyps.main.mem.AlreadyExistingMemberException;
import xyz.thedyps.main.mem.MemberVO;
import xyz.thedyps.main.mem.RegisterRequest;
import xyz.thedyps.main.svinterf.MemberRegisterService;

@Service
public class MemberRegisterServiceImpl implements MemberRegisterService {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int getMemCount() throws Exception {
		return sqlSession.selectOne("mem.count");
	}

	@Override
	public void regMem(RegisterRequest req) {
		
		MemberVO memberVO = sqlSession.selectOne("mem.selByEmail", req.getEmail());
		if (memberVO != null) {
			throw new AlreadyExistingMemberException("dup email " + req.getEmail());
		}
		MemberVO newMember = new MemberVO(req.getEmail(), req.getPassword(), req.getName(), new Date());
		sqlSession.insert("mem.insert", newMember);
	}
	
	@Override
	public void update(MemberVO member) {
		Map<String, Object> map = new HashMap<>();
		map.put("name", member.getName());
		map.put("password", member.getPassword());
		map.put("email", member.getEmail());
	}
	
	/*
	public List<MemberVO> selectAll() {
		List<MemberVO> results = jdbcTemplate.query("select * from MEMBER",
				new RowMapper<MemberVO>() {
					@Override
					public MemberVO mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						MemberVO member = new MemberVO(rs.getString("EMAIL"),
								rs.getString("PASSWORD"),
								rs.getString("NAME"),
								rs.getTimestamp("REGDATE"));
						member.setId(rs.getLong("ID"));
						return member;
					}
				});
		return results;
	}

	public int count() {
		Integer count = jdbcTemplate.queryForObject("select count(*) from MEMBER", Integer.class);
		return count;
	}
	*/

}
