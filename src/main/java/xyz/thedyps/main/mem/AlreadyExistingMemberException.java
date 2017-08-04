package xyz.thedyps.main.mem;

@SuppressWarnings("serial")
public class AlreadyExistingMemberException extends RuntimeException {

	public AlreadyExistingMemberException(String message) {
		super(message);
	}

}
