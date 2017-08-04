package xyz.thedyps.main.svinterf;

import java.util.List;

import xyz.thedyps.main.goods.PcFilterListVO;
import xyz.thedyps.main.goods.PcListVO;

public interface PcListService {
	int getPcListCount(String pcType) throws Exception;
	List<PcListVO> getPcList(String pcType, int start, int end) throws Exception;
	PcFilterListVO getPcFilterList() throws Exception;
}
