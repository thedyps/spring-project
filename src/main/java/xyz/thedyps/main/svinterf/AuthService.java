package xyz.thedyps.main.svinterf;

import xyz.thedyps.main.mem.AuthInfo;

public interface AuthService {
	AuthInfo authenticate(String email, String password);
}
