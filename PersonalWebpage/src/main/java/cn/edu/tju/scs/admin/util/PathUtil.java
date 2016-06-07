package cn.edu.tju.scs.admin.util;

/**
 * Created by jack on 2016/5/13.
 */
public class PathUtil {
    public static String BASE_FILE_PATH;

    static {
        String base = PathUtil.class.getResource("/").toString();
        char separator = '/';

//        System.out.println("File.separator"+File.separator);  // String
//        System.out.println("File.separatorChar"+File.separatorChar);  // Char
//
//        System.out.println("File.pathSeparator"+File.pathSeparator); // String
//        System.out.println("File.pathSeparatorChar"+File.pathSeparatorChar); // Char

        int index = base.lastIndexOf(separator);
        base = base.substring(0,index);

        index = base.lastIndexOf(separator);
        base = base.substring(0,index);

        index = base.lastIndexOf(separator);
        base = base.substring(0,index);

        index = base.lastIndexOf(separator);
        base = base.substring(0,index);

        int fileIndex = 0;
        if((fileIndex = base.indexOf("file:")) != -1){
            base = base.substring(fileIndex+6);
        }
        BASE_FILE_PATH = base;

    }
}
