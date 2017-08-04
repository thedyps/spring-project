package xyz.thedyps.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import org.springframework.ui.Model;

import xyz.thedyps.main.mem.AlreadyExistingMemberException;
import xyz.thedyps.main.mem.RegisterRequest;
import xyz.thedyps.main.mem.RegisterRequestValidator;
import xyz.thedyps.main.svinterf.MemberRegisterService;

@Controller
public class MemRegController {
	@Autowired
	private MemberRegisterService memberRegisterService;

	@RequestMapping("/register/step1")
	public String handleStep1() {
		return "register/step1";
	}

	@RequestMapping(value = "/register/step2", method = RequestMethod.POST)
	public String handleStep2(
			@RequestParam(value = "agree", defaultValue = "false") Boolean agree,
			Model model) {
		if (!agree) {
			return "register/step1";
		}
		model.addAttribute("registerRequest", new RegisterRequest());
		return "register/step2";
	}

	@RequestMapping(value = "/register/step2", method = RequestMethod.GET)
	public String handleStep2Get() {
		return "redirect:step1";
	}

	@RequestMapping(value = "/register/step3", method = RequestMethod.POST)
	public String handleStep3(RegisterRequest regReq, Errors errors) {
		new RegisterRequestValidator().validate(regReq, errors);
		if (errors.hasErrors())
			return "register/step2";
		try {
			memberRegisterService.regMem(regReq);
			return "register/step3";
		} catch (AlreadyExistingMemberException ex) {
			errors.rejectValue("email", "duplicate");
			return "register/step2";
		}
	}
}
