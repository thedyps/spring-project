package xyz.thedyps.main.svimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xyz.thedyps.main.goods.PcFilterListVO;
import xyz.thedyps.main.goods.PcListVO;
import xyz.thedyps.main.svinterf.PcListService;

@Service
public class PcListServiceImpl implements PcListService {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	PcFilterListVO pcFilterListVO;
	
	@Override
	public int getPcListCount(String pcType) throws Exception {
		return sqlSession.selectOne("pcList.count", pcType);
	}
	
	@Override
	public List<PcListVO> getPcList(String pcType, int start, int end) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("pcType", pcType);
		param.put("start", start);
		param.put("end", end);
		return sqlSession.selectList("pcList.show", param);
	}
		
	@Override
	public PcFilterListVO getPcFilterList() throws Exception {
		pcFilterListVO.setFilterPcBrand(sqlSession.selectList("pcList.filterPcBrand"));
		pcFilterListVO.setFilterCpuKind(sqlSession.selectList("pcList.filterCpuKind"));
		pcFilterListVO.setFilterRamSpace(sqlSession.selectList("pcList.filterRamSpace"));
		pcFilterListVO.setFilterGraKind(sqlSession.selectList("pcList.filterGraKind"));
		pcFilterListVO.setFilterOsName(sqlSession.selectList("pcList.filterOsName"));
		return pcFilterListVO;
	}
}
