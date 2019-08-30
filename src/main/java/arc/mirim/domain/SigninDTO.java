package arc.mirim.domain;

public class SigninDTO {
    private String signinId;
    private String signinPwd;
    private String signinName;

    public String getSigninId() {
        return this.signinId;
    }

    public void setSigninId(String signinId) {
        this.signinId = signinId;
    }

    public String getSigninPwd() {
        return this.signinPwd;
    }

    public void setSigninPwd(String signinPwd) {
        this.signinPwd = signinPwd;
    }

	public String getSigninName() {
		return signinName;
	}

	public void setSigninName(String signinName) {
		this.signinName = signinName;
	}

	@Override
	public String toString() {
		return "SigninDTO [signinId=" + signinId + ", signinPwd=" + signinPwd + ", signinName=" + signinName + "]";
	}
}