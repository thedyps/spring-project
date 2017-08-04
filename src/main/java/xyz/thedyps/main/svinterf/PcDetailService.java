package xyz.thedyps.main.svinterf;

import xyz.thedyps.main.goods.PcDetailImgVO;
import xyz.thedyps.main.goods.PcDetailVO;
import xyz.thedyps.main.goods.PcSummaryVO;

public interface PcDetailService {
	PcSummaryVO getPcSummary(String pcCode);
	PcDetailVO getPcDetail(String pcCode);
	PcDetailImgVO getPcImg(String pcCode);
}
