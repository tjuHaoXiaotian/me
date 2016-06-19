package cn.edu.tju.scs.common.dto;

/**
 * 错误信息
 * Created by jack on 2016/5/26.
 */
public class ErrorInfo {
    private String errorName;

    private String errorInfo;

    public ErrorInfo() {
    }

    public ErrorInfo(String errorName, String errorInfo) {
        this.errorName = errorName;
        this.errorInfo = errorInfo;
    }

    public String getErrorName() {
        return errorName;
    }

    public void setErrorName(String errorName) {
        this.errorName = errorName;
    }

    public String getErrorInfo() {
        return errorInfo;
    }

    public void setErrorInfo(String errorInfo) {
        this.errorInfo = errorInfo;
    }
}
