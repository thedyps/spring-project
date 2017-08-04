package xyz.thedyps.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import xyz.thedyps.main.svinterf.PcDetailService;

import org.springframework.ui.Model;

@Controller
public class PcDetailController {
	@Autowired
	private PcDetailService pcDetailService;

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String pcDetail(Model model) {
		
		model.addAttribute("pcSummary", pcDetailService.getPcSummary("PC-X001"));
		model.addAttribute("pcDetail", pcDetailService.getPcDetail("PC-X001"));
		model.addAttribute("pcImg", pcDetailService.getPcImg("PC-X001"));
		return "pcDetail";
	}
}
