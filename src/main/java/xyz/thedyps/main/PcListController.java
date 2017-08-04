package xyz.thedyps.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import xyz.thedyps.main.svinterf.*;

@Controller
public class PcListController {
	
	@Autowired
	PcListService pcListService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@RequestParam(value="pcType", required=false, defaultValue="Office") String pcType, Model model) 
			throws Exception {
		model.addAttribute("pcType", pcType);
		model.addAttribute("pcListCount", pcListService.getPcListCount(pcType));
		model.addAttribute("pcList", pcListService.getPcList(pcType, 1, 10));
		model.addAttribute("pcFilterListVO",  pcListService.getPcFilterList());
		return "index";
	}
}
