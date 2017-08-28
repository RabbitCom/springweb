package com.mz.dataSyn;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 
 * @author Xiaohui  Li
 *
 */
public class JDBCUtil {

	
	public static Connection conn;
	public static Statement stmt;
	public static ResultSet rs;
	
	public static Connection getJDBCconn(){
		 String url = "jdbc:mysql://124.193.218.90:3306/cnlive_new_oa" ;    
	     String username = "cnlive_oa" ;   
	     String password = "H8rf#_3@ccx9(" ;   
	     try{   
	    	 conn =  DriverManager.getConnection(url , username , password ) ;   
	     }catch(SQLException se){   
	       se.printStackTrace() ;   
	     }   
	     return conn;
	}
	
	
	
	 
	 // 通过结果集元数据封装List结果集
    public static  List<Map<String, Object>>  getDataOne(Map<String,Object> baseInfo) {
    	String id = (String) baseInfo.get("id");
    	String name = (String) baseInfo.get("name");
    	String description = (String) baseInfo.get("description");
    	String createTime = (String) baseInfo.get("createTime");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = " SELECT * FROM video_pool_files WHERE video_pool_bases_id = '"+id+"' order by id";
//        String sql = "";
        try {
            conn = getJDBCconn();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            ResultSetMetaData rsmd = ps.getMetaData();
            int columnCount = rsmd.getColumnCount();
            List<Map<String, Object>> datas = new ArrayList<Map<String, Object>>();
            while (rs.next()) {
            	Map<String, Object> content = new HashMap<String, Object>();
                for (int i = 1; i < columnCount+1; i++) {
                	 content.put(rsmd.getColumnLabel(i), rs.getObject(rsmd
                            .getColumnLabel(i)));
                }
                content.put("id", id);
                content.put("videoname", name);
                content.put("description", description);
                content.put("createTime", createTime);
//                if(content.get("real_path").toString().indexOf("http://172.16.250.253")>-1){
                	  datas.add(content);
//                }
                content= null;
            }
//            System.out.println(datas.toString());
            return datas;
        } catch (Exception e) {
            return null;
        } finally {
             free(rs, ps, conn);
        }
    }
	
    
    
 
	
    public static List<Map<String,Object>> getBaseList(){
    	String sql = "SELECT encrypt_id,name,description,create_time from video_pool_bases where   status = 'checkMakesure' and  t_video_type_id is null order by id  limit 60000,100";
    	List<Map<String,Object>> baseList = new ArrayList<Map<String,Object>>();
	    Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
    	  conn = getJDBCconn();
		  ps = conn.prepareStatement(sql);
		  rs = ps.executeQuery();
		  while(rs.next()){
			 Map<String,Object> baseInfo = new HashMap<String,Object>();
			 String id =  rs.getString("encrypt_id");
			 String name =  rs.getString("name");
			 String description =  rs.getString("description");
			 String createTime =  rs.getString("create_time");
			 baseInfo.put("id", id);
			 baseInfo.put("name", name);
			 baseInfo.put("description", description);
			 baseInfo.put("createTime", createTime);
			 baseList.add(baseInfo);
			 baseInfo = null;
		  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			free(rs, ps, conn);
		}
    	System.out.println(baseList);
    	return baseList;
    }
    
    public static int gcd(int m, int n) {
    	while (true) {
	    	if ((m = m % n) == 0)
	    	return n;
	    	if ((n = n % m) == 0)
	    	return m;
    	}
    }
    
    public static String getRatio(int m, int n){
    	String b = "";
    	int a = gcd(m,n);
    	int c = m/a;
    	int d = n/a;
    	b = c +":"+ d;
    	return b;
    }
    
    public static Map<String,Object> getDataMap(List<Map<String, Object>> videoFiles){
    	 Map<String,Object> videoMap = new HashMap<String, Object>();
    	 String imgUrl = "http://y1.cnliveimg.com:8080/picture/1.jpg";        //图片地址 ，取最大的一张 
    	 String originUrl  = "";      //源视频地址
    	 String resOrigin  = "";      //源视频分辨率
    	 String sizeOrigin  = "";      //源视频大小
    	 String duration  = "";        //时长 （毫秒）
    	 String vbrOrigin  = "";       //源视频码流
    	 String ratioOrigin = "";      //源视频比例
    	 int fileSize = 0;
//    	 String gfmt = "";
    	 int codeRate = 800;
//    	 String videoUUID = ""; 
//    	 String videoName = ""; 
//    	 String videoDes = "";
//    	 String createTime = ""; 
    	 
    	 Double sizeImg = 0.0;
    	 for(Map<String, Object> listMap : videoFiles){
    		 if(listMap.get("type").equals("mpg") || listMap.get("type").equals("mp4")){
    			 String  realPath = (String) listMap.get("real_path") ;
    			 String  newPath = (String) listMap.get("new_alias_path") ;
    			 String  name = (String) listMap.get("name") ;
    			 String  width = (String) listMap.get("width") ;
    			 String  height = (String) listMap.get("height") ;
    			 String  size = (String) listMap.get("size") ;
    			 String  length = (String) listMap.get("length") ;
    			 String  info = (String) listMap.get("info") ;
    			 String  videoUUID = (String) listMap.get("id") ;
    			 String  videoName = (String) listMap.get("videoname") ;
    			 String  videoDes = (String) listMap.get("description") ;
    			 String  createTime = (String) listMap.get("createTime") ;
    			 String  type = "mp4";
    			 originUrl = realPath + newPath + name;
    			 resOrigin = width + "*"+ height;
    			 if(size == null||size.equals("")){
//    				 adderrData(videoUUID, "size大小为空");
//    				 videoMap = null; 
//    				 return videoMap;
    				 size = "0.0";
    			 }
    			 
				 Double videoSize = Double.parseDouble(size);
				 if(!size.contains(".")){
					 DecimalFormat df2 = new DecimalFormat("#");
	    			 String size1 = df2.format(videoSize) +"";
	    			 DecimalFormat df = new DecimalFormat("#.00");
    				 videoSize = videoSize/1048576 ;
    				 size = df.format(videoSize) + "M";
//	        			}else if(videoSize > 1024){
//	        				 videoSize = videoSize/1024 ;
//	        				 size = df.format(videoSize) + "M";
	    			 sizeOrigin = size;
	    			 
	    			 fileSize = Integer.parseInt(size1);
				 }else{
					 DecimalFormat df2 = new DecimalFormat("#");
	    			 String size1 = df2.format(videoSize * 1024) +"";
	    			 DecimalFormat df = new DecimalFormat("#.00");
	    			 if(videoSize > 1024 ){
	    				 videoSize = videoSize/1024 ;
	    				 size = df.format(videoSize) + "G";
//	        			 }else if(videoSize > 1024){
//	        				 videoSize = videoSize/1024 ;
//	        				 size = df.format(videoSize) + "M";
	    			 }else{
	    				 size = size + "M";
	    			 }
	    			 sizeOrigin = size;
	    			 
	    			 fileSize = Integer.parseInt(size1);
				 }
    			 
    			 
    			 duration = (Double.parseDouble(length)*1000+"").substring(0, (Double.parseDouble(length)*1000+"").indexOf("."));
    			 ratioOrigin = getRatio(Integer.parseInt(width),Integer.parseInt(height));
//    			 vbrOrigin = getVbr(info);
    			 videoMap.put("originUri", originUrl);
    			 videoMap.put("resOrigin", resOrigin);
    			 videoMap.put("sizeOrigin", sizeOrigin);
    			 videoMap.put("duration", duration);
    			 videoMap.put("vbrOrigin", "");
    			 videoMap.put("ratioOrigin", ratioOrigin);
    			 videoMap.put("videoUUID", videoUUID);
    			 videoMap.put("videoName", videoName);
    			 videoMap.put("videoDes", videoDes);
    			 videoMap.put("createTime", createTime);
    			 videoMap.put("fileSize", fileSize);
//    			 videoMap.put("spId", 82);
    			 videoMap.put("spId", 60);
    			 videoMap.put("gfmt", type);
    			 videoMap.put("codeRate", codeRate);
    		 }else{
    			 String imgsize = (String) listMap.get("size") ;
    			 Double iSize = Double.parseDouble(imgsize);
    			 if(iSize > sizeImg){
    				 sizeImg = iSize;
    				 imgUrl = (String) listMap.get("real_path") + (String) listMap.get("new_alias_path") + (String) listMap.get("name");
    			 }
    		 }
    	 }
    	 
    	 videoMap.put("imgUrl", imgUrl);
    	 return videoMap;
    	
    }
    
    public static String getVbr(String vbrOrigin){
    	String vbr = "";
    	String[] a = vbrOrigin.split("    ");
    	String[] b = a[0].split(",");
    	String c = b[2].substring(b[2].indexOf(":")+2,b[2].indexOf("k")-1);
//    	System.out.println(c);
    	return c;
    }
    
    
    public static void main(String[] args) {
//    	getBaseList();
//    	Map<String,Object> videoMap = getDataMap(getDataOne("20fe9e4c33904e4cb1a6cf07f6c99b44"));
//    	System.out.println(videoMap.toString());
//    	getVbr("Duration: 00:03:43.68, start: 0.457789, bitrate: 8879 kb/s    Stream #0.0[0x1e0]: Video: mpeg2video, yuv420p, 1280x720 [PAR 1:1 DAR 16:9], 8000 kb/s, 25 fps, 25 tbr, 90k tbn, 50 tbc    Stream #0.1[0x1c0]: Audio: mp2, 48000 Hz, 2 channels, s16, 128 kb/s");
   
    	 List<Map<String,Object>> videoList = getBaseList();
//    	 for(Map<String,Object> videoMap:videoList){
    		 Map<String,Object> videoMaps = getDataMap(getDataOne(videoList.get(0)));
    		 System.out.println(videoMaps.toString());
//    	 }
//    	adderrData("1","2");
    }
    
    public static void adderrData(String uuid ,String message){
    	String sql = "insert into mz_error_data(uuid,message) value ('"+uuid+"' ,'"+message+"')";
    	List<Map<String,Object>> baseList = new ArrayList<Map<String,Object>>();
	    Connection conn = null;
        PreparedStatement ps = null;
//        int rs = null;
        try {
    	  conn = getJDBCconn();
		  ps = conn.prepareStatement(sql);
		  int rs = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			free(null, ps, conn);
		}
    	
    }
    
    
 // 释放连接
    public static void free(ResultSet rs, Statement st, Connection conn) {
        try {
            if (rs != null) {
                rs.close(); // 关闭结果集
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (st != null) {
                    st.close(); // 关闭Statement
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (conn != null) {
                        conn.close(); // 关闭连接
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            }

        }

    }
}
