package cn.edu.tju.scs.tv.web.controller;

import cn.edu.tju.scs.common.Constants;
import cn.edu.tju.scs.common.Type;
import cn.edu.tju.scs.common.dto.BizCode;
import cn.edu.tju.scs.common.dto.StateCode;
import cn.edu.tju.scs.tv.domain.User;
import cn.edu.tju.scs.tv.domain.Video;
import cn.edu.tju.scs.tv.service.CommentService;
import cn.edu.tju.scs.tv.service.UserService;
import cn.edu.tju.scs.tv.service.VideoService;
import cn.edu.tju.scs.tv.util.GetIP;
import cn.edu.tju.scs.tv.web.controller.base.BaseController;
import org.apache.commons.io.IOUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.InetAddress;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Video Controller
 * Created by jack on 2016/3/16.
 */
@Controller
@RequestMapping(value = "/videos")
public class VideoController extends BaseController {

    @Autowired
    VideoService videoService;

    @Autowired
    CommentService commentService;

    /**
     * 获取视频列表 html 页面
     * @return html
     */
    @RequiresUser
    @RequiresRoles(value={"admin"})
    @RequestMapping(value = "/videos.html",method = RequestMethod.GET)
    public String getVideosPage(@RequestParam(value = "type",required = false) Integer type,Model model){
        if(type != null){
            model.addAttribute("type",type);
        }
        return "admin/admin-videos";
    }

    /**
     * 访问所有 video
     * @return Json
     */
    @RequestMapping( method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public @ResponseBody
    StateCode getAll(@RequestParam(value = "key",required = false) String key,@RequestParam(value = "type",required = false) Integer type) {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        if(key == null || key.equals("")){
            if(type == null){
                stateCode.addData("videos", videoService.getAll());
            }else{
                stateCode.addData("videos", videoService.getAllByType(type));
            }
        }else{
            if(type == null){
                stateCode.addData("videos",videoService.getAll(key));
            }else{
                stateCode.addData("videos", videoService.getAllByKeyAndType(key,type));
            }
        }
        return stateCode;
    }


    /**
     * uplaod 页面
     * @return
     */
    @RequiresRoles(value={"admin"})
    @RequestMapping(value = "/upload.html",method = RequestMethod.GET)
    public String getVideoUploadPage(){
        return "admin/admin-video-upload";
    }

    @RequiresRoles(value={"admin"})
    @RequestMapping("/index.html")
    public String getAdminIndex(){
        return "admin/admin-index-config";
    }

    /**
     * 访问首页视频 video
     * @return Json
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET,produces = {"application/json;charset=utf-8"})
    public @ResponseBody
    StateCode getAllIndex() {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("videos",videoService.getAllIndex(1));
        return stateCode;
    }


    /**
     * 访问一个 video
     * @return
     */
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public @ResponseBody
    StateCode getVideo(@PathVariable int id ) {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("video", videoService.getVideo(id));
        return stateCode;
    }

    /**
     * 设为首页大图
     * @param id
     * @return
     */
    @RequiresRoles(value={"admin"})
    @RequestMapping(value = "/{id}/setIndex",method = RequestMethod.GET,produces = "application/json;charset=utf-8")
    public @ResponseBody StateCode setIndex(@PathVariable("id") Integer id){
        videoService.setIndex(id);
        return StateCode.buildCode(BizCode.SUCCESS);
    }

    /**
     * 取消首页大图
     * @param id
     * @return
     */
    @RequiresRoles(value={"admin"})
    @RequestMapping(value = "/{id}/unSetIndex",method = RequestMethod.GET,produces = "application/json;charset=utf-8")
    public @ResponseBody StateCode unSetIndex(@PathVariable("id") Integer id){
        videoService.unSetIndex(id);
        return StateCode.buildCode(BizCode.SUCCESS);
    }

    /**
     * 置顶
     * @param id
     * @return
     */
    @RequiresRoles(value={"admin"})
    @RequestMapping(value = "/{id}/setTop",method = RequestMethod.GET,produces = "application/json;charset=utf-8")
    public @ResponseBody StateCode setTop(@PathVariable("id") Integer id){
        videoService.unSetIndex(id);
        return StateCode.buildCode(BizCode.SUCCESS);
    }

    /**
     * 检查一个 video
     * admin
     * @return
     */
    @RequiresRoles(value={"admin"})
    @RequestMapping(value = "/check/{id}",method = RequestMethod.GET)
    public String checkVideo(@PathVariable int id,Model model) {
        Video video = videoService.getVideo(id);
        if(video != null){
            model.addAttribute("video",video);
            return "admin/admin-video-check";
        }else{
            return "404";
        }
    }




    /**
     * 更新一个 video
     * @return
     */
    @RequiresRoles(value={"admin"})
    @RequestMapping(value="/{id}",method = RequestMethod.PUT)
    public @ResponseBody
    StateCode updateVideoByPut(@RequestBody  Video video,@PathVariable int id){
        {
            // 是不是有必要
            video.setVideoId(id);

        }
        videoService.updateVideo(video);
        return  StateCode.buildCode(BizCode.SUCCESS);
    }


    /**
     * 访问一个 video 的所有评论
     * @return
     */
    @RequestMapping(value = "/{id}/comments",method = RequestMethod.GET)
    public @ResponseBody
    StateCode getVideoComments(@PathVariable int id ) {
        StateCode stateCode =  StateCode.buildCode(BizCode.SUCCESS);
        stateCode.addData("comments", commentService.getAll(id));
        return stateCode;
    }

    /**
     * 赞
     * @param id
     * @return
     */
    @RequestMapping(value="/{id}/praise",method= RequestMethod.GET)
    public @ResponseBody
    StateCode praiseVideoByGet(@PathVariable int id) {
        if(videoService.praiseVideo(id))
            return  StateCode.buildCode(BizCode.SUCCESS);
        else {
            StateCode stateCode =  StateCode.buildCode(BizCode.NOTFOUND);
            stateCode.addData("error","赞的视频文件不存在或已被移除");
            return stateCode;
        }

    }




    /**
     * 删除一个 video
     * @param id
     * @return
     * @throws java.io.IOException
     */
    @RequiresRoles(value={"admin"})
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public @ResponseBody
    StateCode delete(@PathVariable("id") int id) throws IOException {
        if (videoService.deleteVideo(id)) {
            return  StateCode.buildCode(BizCode.SUCCESS);
        }else {
            return  StateCode.buildCode(BizCode.FAIL);
        }
    }

    /**
     *  浏览器端的下载文件？？？？？？？？？？？？ 是否多余
     * @param id
     * @param response
     * @return
     * @throws java.io.IOException
     */
    @RequestMapping(value = "/{id}/download", method = RequestMethod.GET)
    public @ResponseBody
    StateCode download(@PathVariable("id") int id,HttpServletResponse response) throws IOException {
        String [] result = videoService.getVideoPath(id);
        if(result == null){
            StateCode stateCode  = StateCode.buildCode(BizCode.FAIL);
            stateCode.addData("error","下载的资源文件不存在");
            return stateCode;
        }else{
            try{
//            // 将正确能识别的中文文件名转成ISO8859-1 编码才可以正确下载

                String fileNameEncode = new String(result[1].getBytes(),"ISO8859-1");

                response.setContentType("application/x-msdownload");

                File file;
                if(Constants.SYSTEM_TYPE.contains("windows")){
                    // 是 windows
                   file =  new File(result[0]+"\\" + result[1]);
                }else{   // 是 linux
                   file = new File(result[0] + "/" + result[1]);
                }
                FileInputStream fileInputStream = new FileInputStream(file);

                response.setHeader("Content-Disposition","attachment;filename=" + fileNameEncode);

                OutputStream outputStream = response.getOutputStream();

                IOUtils.copy(fileInputStream, outputStream);
            }catch (FileNotFoundException e){
                e.printStackTrace();
            }catch (IOException e){
                e.printStackTrace();
            }
            return StateCode.buildCode(BizCode.SUCCESS);
        }

    }


    /**
     * 更新一个 video
     * 假定用户是友好的
     * @return
     */
    @RequiresRoles(value={"admin"})
    @RequestMapping(value="/{id}",method= RequestMethod.POST)
    public @ResponseBody
    StateCode updateVideoByPost(@RequestBody Video video,@PathVariable int id) {
        if(video != null){
            Video videoOld = videoService.getVideo(id);
            videoOld.setName(video.getName());
            videoOld.setDescription(video.getDescription());
            videoOld.setPerformer(video.getPerformer());
            videoOld.setType(video.getType());
            videoOld.setAlbum(video.getAlbum());
            videoService.updateVideo(videoOld);
            return  StateCode.buildCode(BizCode.SUCCESS);
        }else{
            return StateCode.buildCode(BizCode.FAIL);
        }
    }

    @Resource
    UserService userService;

    /**
     * 添加一个 video
     * 假定用户是友好的
     * @return
     */
    @RequiresUser
    @RequestMapping(value = "/new",method= RequestMethod.POST,produces = {"application/json;charset=utf-8"})
    public @ResponseBody
    StateCode addVideo(@RequestParam(value = "name",required = false) String name,@RequestParam(value = "description",required = false)String description,
                       @RequestParam(value = "performer",required = false) String performer,@RequestParam(value = "type",required = false) String type,
                        @RequestParam(value = "path",required = false) String path) {

        Video video = new Video();
        if(name!=null){
            video.setName(name);

        }
        if(description != null){
            video.setDescription(description);
        }
        if(performer!=null){
            video.setPerformer(performer);
        }
        if(type != null){
            video.setType(Integer.valueOf(type));
        }
        if(path != null){
            video.setPath(path);
        }

        String username = (String) SecurityUtils.getSubject().getPrincipal();
        User user = userService.findUserByName(username);
        System.out.println("video:"+video);
        video.setUser(user);
        videoService.save(video);
        return StateCode.buildCode(BizCode.SUCCESS);
    }

    /**
     * 更新一个 video
     * 腾讯云回传 url
     * @return
     */
    @RequestMapping(value = "/update",method= RequestMethod.POST,produces = {"application/json;charset=utf-8"})
    public @ResponseBody
    StateCode updateVideo(@RequestParam(value = "playurl",required = true) String playurl,@RequestParam(value = "cover_url",required = true)String cover_url) {

        Video video = videoService.findVideoByUrl(playurl);
        if(video!=null){
            video.setImagePath(cover_url);
        }
        videoService.updateVideo(video);
        return StateCode.buildCode(BizCode.SUCCESS);
    }





    /**
     * 上传文件
     * @param request
     * @return
     * @throws java.io.IOException
     */
    @RequiresUser
    @RequestMapping( method = RequestMethod.POST)
    public @ResponseBody
    StateCode upload(MultipartHttpServletRequest request) throws IOException {
        System.out.println("正在上传0");
        Object uploadResult = handler(request);
        if (uploadResult == null) {
            return StateCode.buildCode(BizCode.FAIL);
        }else {
            StateCode stateCode = StateCode.buildCode(BizCode.SUCCESS);
            stateCode.addData("videoInfo",uploadResult);
            return  stateCode;
        }
    }

    /**
     * 处理上传文件
     * @param request
     * @return
     * @throws java.io.IOException
     */
    public Object handler(MultipartHttpServletRequest request) throws IOException{
        System.out.println("正在上传1");
        MultipartFile file = request.getFile("file");
        if (file == null || file.getSize() < 0) {// step-2 判断file
            System.out.println("size 为 0");
            return null;
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd");
        String getDateString = sdf.format(new Date());

        String uniqueDir = String.valueOf(System.nanoTime());
        URL base = this.getClass().getResource("/"); //先获得本类的所在位置，如/home/popeye/testjava/build/classes/net/
        String path = new File(base.getFile(), "..\\"+"upload").getCanonicalPath(); //就可以得到/home/popeye/testjava/name

        System.out.println("得到的位置：" + path);
        // 上传视频保存位置
        String targetDir;
        String baseUrl;
        if(Constants.SYSTEM_TYPE.contains("windows")){  // 是 windows
//            targetDir  = "D:\\upload\\video\\" + getDateString +"\\"+ uniqueDir+"\\";
            targetDir = request.getSession().getServletContext().getRealPath("/resources/upload");
            targetDir+="\\video\\" + getDateString +"\\"+ uniqueDir+"\\";
            baseUrl =Constants.WINDOWS_HTTP+request.getContextPath()+"/resources/upload/video/" + getDateString + "/" + uniqueDir;
        }else{   // 是 linux
            targetDir = "/alidata/upload/video/" + getDateString +"/"+ uniqueDir;
            baseUrl =Constants.LINUX_HTTP+"upload/video/" + getDateString + "/" + uniqueDir;
        }

        System.out.println(targetDir);


        // 获取 服务器及app路径 http://localhost:8080/chapter1/
        // 测试的时候改为 192.168.191.1
        String realIp = GetIP.getRealIp();
        System.out.println("realIp is :" + realIp);

        InetAddress addr = InetAddress.getLocalHost();
        String ip=addr.getHostAddress();//获得本机IP
        System.out.println("realIp is :" +ip);



        String uploadFileName = file.getOriginalFilename();
        // 返回大小为 2 的数组，【0】 video 路径， 【1】 image 路径,[2] 时长
        String results[] = videoService.uploadVideo(file,targetDir,baseUrl);

        if( results!= null){

            // 业务操作,暂时这样----------------------------------------------------
            // 业务操作
            Video video = new Video();
            // 标题
            video.setName(uploadFileName);
            // 简介
            video.setDescription("视频文件：" + uploadFileName);
            // 演员表
            video.setPerformer("xx 明星");
            // 视频合集，专辑，电视剧名
            video.setAlbum("xx 电视剧");
            // 视频归属类别
            video.setType(Type.MUSIC.getType());

            video.setPath(results[0]);
            video.setImagePath(results[1]);
            video.setPraise(0);
//            String current = MyDate.getCurrentTime();
//            video.setCreatetime(Timestamp.valueOf(current));
//            video.setUpdatetime(Timestamp.valueOf(current));
            video.setVisitedTimes(0);
            video.setSize(file.getSize());
            video.setDuration(results[2]);
            video.setTargetDir(targetDir);
            video.setState(0);

            videoService.save(video);
            return video;
        }else{
            return null;
        }
    }



}
