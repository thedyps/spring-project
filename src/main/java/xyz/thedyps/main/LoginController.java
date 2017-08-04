
package xyz.thedyps.main;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import xyz.thedyps.main.mem.AuthInfo;

import xyz.thedyps.main.mem.IdPasswordNotMatchingException;
import xyz.thedyps.main.mem.LoginCommand;
import xyz.thedyps.main.mem.LoginCommandValidator;
import xyz.thedyps.main.svinterf.AuthService;


@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private AuthService authService;

	@RequestMapping(method = RequestMethod.GET)
	public String form(LoginCommand loginCommand,
			@CookieValue(value = "REMEMBER", required = false) Cookie rememberCookie) {
		if (rememberCookie != null) {
			loginCommand.setEmail(rememberCookie.getValue());
			loginCommand.setRememberEmail(true);
		}
		return "login/loginForm";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String submit(
			LoginCommand loginCommand, Errors errors, HttpSession session,
			HttpServletResponse response) {
		new LoginCommandValidator().validate(loginCommand, errors);
		if (errors.hasErrors()) {
			return "login/loginForm";
		}
		try {
			AuthInfo authInfo = authService.authenticate(
					loginCommand.getEmail(),
					loginCommand.getPassword());

			session.setAttribute("authInfo", authInfo);
			
			Cookie rememberCookie = 
					new Cookie("REMEMBER", loginCommand.getEmail());
			rememberCookie.setPath("/");
			if (loginCommand.isRememberEmail()) {
				rememberCookie.setMaxAge(60 * 60 * 24 * 30);
			} else {
				rememberCookie.setMaxAge(0);
			}
			response.addCookie(rememberCookie);
			
			return "login/loginSuccess";
		} catch (IdPasswordNotMatchingException e) {
			errors.reject("idPasswordNotMatching");
			return "login/loginForm";
		}
	}
}
