package xyz.thedyps.main.svimpl;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xyz.thedyps.main.goods.PcDetailImgVO;
import xyz.thedyps.main.goods.PcDetailVO;
import xyz.thedyps.main.goods.PcSummaryVO;
import xyz.thedyps.main.svinterf.PcDetailService;

@Service
public class PcDetailServiceImpl implements PcDetailService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public PcSummaryVO getPcSummary(String pcCode) {
		return sqlSession.selectOne("pcDetail.summary", pcCode);
	}
	
	@Override
	public PcDetailVO getPcDetail(String pcCode) {
		return sqlSession.selectOne("pcDetail.detail", pcCode);	
	}

	@Override
	public PcDetailImgVO getPcImg(String pcCode) {
		Map<String, Object> param = new HashMap<>();
		final int index = (int)sqlSession.selectOne("pcDetail.pcImgCount", pcCode) / 2 + 2;
		param.put("pcCode", pcCode);
		param.put("index", index);
		
		PcDetailImgVO pcDetailImgVO = sqlSession.selectOne("pcDetail.img", pcCode);
		pcDetailImgVO.setPcImg(sqlSession.selectList("pcDetail.pcImg", param));
		pcDetailImgVO.setThumbnailImg(sqlSession.selectList("pcDetail.thumbnailImg", param));
		return pcDetailImgVO;
	}
}
