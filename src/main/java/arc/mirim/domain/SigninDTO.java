package arc.mirim.domain;

public class SigninDTO {
    private String signinId;
    private String signinPwd;
    private boolean signinCookie;


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

    public boolean isSigninCookie() {
        return this.signinCookie;
    }

    public boolean getSigninCookie() {
        return this.signinCookie;
    }

    public void setSigninCookie(boolean signinCookie) {
        this.signinCookie = signinCookie;
    }


    @Override
    public String toString() {
        return "{" +
            " signinId='" + getSigninId() + "'" +
            ", signinPwd='" + getSigninPwd() + "'" +
            ", signinCookie='" + isSigninCookie() + "'" +
            "}";
    }

}