package cn.edu.tju.scs.common;

/**
 * 放常量文件
 * Created by jack on 2016/3/17.
 */
public class Constants {


    public final static String USER_SESSION_KEY = "user_session_key";

    public static final String CURRENT_USER = "user";

    public static final String SYSTEM_TYPE = System.getProperties().getProperty("os.name").toLowerCase();

    public static String LINUX_HTTP = "http://121.42.217.4:8080/";
    public static String WINDOWS_HTTP = "http://localhost:8080";
}
