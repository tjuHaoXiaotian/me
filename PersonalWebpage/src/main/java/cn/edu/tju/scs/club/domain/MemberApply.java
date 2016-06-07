//package cn.edu.tju.scs.club.domain;
//
//import cn.edu.tju.scs.club.domain.base.BaseDomain;
//
//import java.sql.Timestamp;
//import java.util.Set;
//
///**
// * 学生加入社团
// * Created by jack on 2016/3/25.
// */
//public class MemberApply extends BaseDomain {
//
//    private Long memberApplyId;
//
//    private String studentName;
//
//    // 0 男，1 女
//    private int sex;
//
//    private String clubName;
//
//    private int grade;
//
//    private String tel;
//
//    private String major;
//
//    private String info;
//
//    private Set<Department> targetDeps;
//
//    private Timestamp createtime;
//
//    private Timestamp updatetime;
//
//    public Long getMemberApplyId() {
//        return memberApplyId;
//    }
//
//    public void setMemberApplyId(Long memberApplyId) {
//        this.memberApplyId = memberApplyId;
//    }
//
//    public String getStudentName() {
//        return studentName;
//    }
//
//    public void setStudentName(String studentName) {
//        this.studentName = studentName;
//    }
//
//    public int getSex() {
//        return sex;
//    }
//
//    public void setSex(int sex) {
//        this.sex = sex;
//    }
//
//    public String getClubName() {
//        return clubName;
//    }
//
//    public void setClubName(String clubName) {
//        this.clubName = clubName;
//    }
//
//    public int getGrade() {
//        return grade;
//    }
//
//    public void setGrade(int grade) {
//        this.grade = grade;
//    }
//
//    public String getTel() {
//        return tel;
//    }
//
//    public void setTel(String tel) {
//        this.tel = tel;
//    }
//
//    public String getMajor() {
//        return major;
//    }
//
//    public void setMajor(String major) {
//        this.major = major;
//    }
//
//    public String getInfo() {
//        return info;
//    }
//
//    public void setInfo(String info) {
//        this.info = info;
//    }
//
//    public Set<Department> getTargetDeps() {
//        return targetDeps;
//    }
//
//    public void setTargetDeps(Set<Department> targetDeps) {
//        this.targetDeps = targetDeps;
//    }
//
//    public Timestamp getCreatetime() {
//        return createtime;
//    }
//
//    public void setCreatetime(Timestamp createtime) {
//        this.createtime = createtime;
//    }
//
//    public Timestamp getUpdatetime() {
//        return updatetime;
//    }
//
//    public void setUpdatetime(Timestamp updatetime) {
//        this.updatetime = updatetime;
//    }
//}
