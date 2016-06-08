package cn.edu.tju.scs;

/**
 * url config
 * Created by haoxiaotian on 2016/6/8 16:17.
 */
public class UrlConfig {

    // 单点登录服务器 url
    private  String ssoUrlLogin;

    // 单点退出 url
    private String ssoUrlLogout;

    // 本机服务器ip
    private String localUrl;

    public String getLocalUrl() {
        return localUrl;
    }

    public void setLocalUrl(String localUrl) {
        this.localUrl = localUrl;
    }

    public String getSsoUrlLogin() {
        return ssoUrlLogin;
    }

    public void setSsoUrlLogin(String ssoUrlLogin) {
        this.ssoUrlLogin = ssoUrlLogin;
    }

    public String getSsoUrlLogout() {
        return ssoUrlLogout;
    }

    public void setSsoUrlLogout(String ssoUrlLogout) {
        this.ssoUrlLogout = ssoUrlLogout;
    }
}
