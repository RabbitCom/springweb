package com.icms.dataSyn;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSetMetaData;
import com.mysql.jdbc.Statement;

public class JDBCUTil {

	
	public static Connection getJDBCconn(){
		 String url = "jdbc:mysql://124.193.218.90:3306/cnlive_new_oa" ;    
	     String username = "cnlive_oa" ;   
	     String password = "H8rf#_3@ccx9(" ;   
	     Connection conn = null;
	     try{   
	    	 conn =  (Connection) DriverManager.getConnection(url , username , password ) ;   
	     }catch(SQLException se){   
	    	 System.out.println("链接失败");
	     }   
	     return conn;
	}
	
 
	public static void main(String[] args) {
		List<Map<String, Object>> mapList = getVideoBase();
//		readFile("25");
		ExecutorService pool = Executors.newFixedThreadPool(5);
		for(int i = 0 ; i < mapList.size(); i++){
			if(!pool.isShutdown()){
				pool.execute(new icmsDataJob(mapList.get(i)));
			}
			if(i== mapList.size()-1){
				pool.shutdown();
			}
		}
	}
	
	
	
	public static  List<Map<String, Object>>   getVideoBase(){
//		    List<Map<String, Object>> datas = new ArrayList<Map<String, Object>>();
		    Connection conn = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
			String sql = "select * from m_base_info WHERE vpb_encrypt_id  in ("+getStringList()+")";
				try {
					conn = getJDBCconn();
		            ps = (PreparedStatement) conn.prepareStatement(sql);
		            rs = ps.executeQuery();
		            ResultSetMetaData rsmd = (ResultSetMetaData) ps.getMetaData();
		            int columnCount = rsmd.getColumnCount();
		            List<Map<String, Object>> datas = new ArrayList<Map<String, Object>>();
		            while (rs.next()) {
		            	Map<String, Object> content = new HashMap<String, Object>();
		                for (int i = 1; i < columnCount+1; i++) {
		                	 content.put(rsmd.getColumnLabel(i), rs.getObject(rsmd
		                            .getColumnLabel(i)));
		                }
		                datas.add(content);
		                content= null;
		            }
//		            System.out.println(datas.toString());
		            return datas;
		        } catch (Exception e) {
		            throw new RuntimeException();
		        } finally {
		             free(rs, ps, conn);
		        }
	}
	
	 // 通过结果集元数据封装List结果集
    public static  List<Map<String, Object>>  readFile(String videoid) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from m_file_info where m_base_info_id = '"+videoid+"'";
        try {
            conn = getJDBCconn();
            ps = (PreparedStatement) conn.prepareStatement(sql);
            rs = ps.executeQuery();
            ResultSetMetaData rsmd = (ResultSetMetaData) ps.getMetaData();
            int columnCount = rsmd.getColumnCount();
            List<Map<String, Object>> datas = new ArrayList<Map<String, Object>>();
            while (rs.next()) {
            	Map<String, Object> content = new HashMap<String, Object>();
                for (int i = 1; i < columnCount+1; i++) {
                	 content.put(rsmd.getColumnLabel(i), rs.getObject(rsmd
                            .getColumnLabel(i)));
                }
                datas.add(content);
                content= null;
            }
//            System.out.println(datas.toString());
            return datas;
        } catch (Exception e) {
            throw new RuntimeException();
        } finally {
             free(rs, ps, conn);
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
    
    public static Map<String,Object> getFileInfo(List<Map<String, Object>> video_files){
//    	System.out.println(video_files);
    	Map<String,Object> fileInfo = new HashMap<String,Object>();
    	 Map<String,Object> mapList = new HashMap<String, Object>();
    	 List<Map<String,Object>> videoList = new ArrayList<Map<String, Object>>(); 
    	 List<Map<String,Object>> imgList = new ArrayList<Map<String, Object>>(); 
    	for(Map<String, Object> files:video_files){
    		 String httpUrl = (String) files.get("http_url");
    		 String transCodeFmt = httpUrl.substring(httpUrl.indexOf(".")+1);
	    		 if(transCodeFmt.equals("jpg")){
	    			
	    			 Map<String, Object> imgBig = new HashMap<String, Object>();
	    	    	 Map<String, Object> imgPost = new HashMap<String, Object>();
	    	    	 Map<String, Object> imgSma = new HashMap<String, Object>();
	    	    	 Map<String, Object> img = new HashMap<String, Object>();
	    	    	 if(files.get("type").toString().equals("101") ){
	    	    		 String bigUrl =  httpUrl;
	    	    		 imgBig.put("485*303", bigUrl);
		            	 mapList.put("ar1610", imgBig);
		            	 imgPost.put("316*506", bigUrl);
		        		 mapList.put("ar1016", imgPost);
	    	    	 }
	    	    	if(files.get("type").toString().equals("100")){
	    	    		String smaUrl = httpUrl;
	    	    		imgSma.put("224*398", smaUrl);
		        		 mapList.put("ar916", imgSma);
		        		 img.put("112*63", smaUrl);
		        		 img.put("224*126", smaUrl);
		            	 mapList.put("ar169", img);
	    	    	}
	    		 }else{
	    			 Map<String, Object> video = new HashMap<String, Object>();
	    			 video.put("storeUri", httpUrl);
    				 video.put("videoWidth", files.get("width"));
	    			 video.put("videoHeight", files.get("height"));
	    			 video.put("codeRate", files.get("type"));
	        		 video.put("transCodeFmt", transCodeFmt);
	        		 video.put("storageTranscode", 111);
	        		 video.put("storageDistribute", 109);
	        		 videoList.add(video);
	    		 }
    	}
    	 imgList.add(mapList);
    	fileInfo.put("imgInfos", imgList);
    	fileInfo.put("playInfos", videoList);
    	return fileInfo;
    }
	
  
    
    public static String addData(String contentID , String errorMeg) {
    	String sql = "INSERT INTO mz_error_data (uuid , message) VALUE ('"+contentID +"','"+errorMeg+"')";
    	String dataMeg = "";
    	Connection conn = null;
    	PreparedStatement stmt1 = null;
    	try {
    	    conn = getJDBCconn();
    	    stmt1 = (PreparedStatement) conn.prepareStatement(sql) ;
			int a = stmt1.executeUpdate();
			if( a >0){
				dataMeg = "success";
			}
		} catch (SQLException e) {
			dataMeg = "fail";
		}finally {
			free(null, stmt1, conn);
       }
    	return dataMeg;
    }
    
    

    public static int stringNumbers(String str)  {
    	String url = str.substring(str.length()-4);
    	int counter = 0;
        if (url.indexOf(".")==-1) {
            return 0;
        }
       char[] chStr = url.toCharArray();
        for(int i = 0; i < chStr.length; i++){
//        	chStr[i].toString();
        	if(String.valueOf(chStr[i]).equals(".")){
        		counter++;
        	};
        }
        
        return counter;
    }
    
	public static String getStringList(){
		String lineTxt = "'0e7b93cd546949738064ef8715be0ddb',"+
		"'562d59cbbecc4f73827b2811cb7c3544',"+
		"'b3525bf8a9c04151b14b4636a5dfab57',"+
		"'4f185b92e64a4a8ea9f74c2fff937347',"+
		"'3655fa1ac560450599532e213b2443bd',"+
		"'beed568ec77f4f01b99b566646442cb3',"+
		"'2e12e2f6a39c40319908adfb11ac7181',"+
		"'02471c261c924160ae835bfd688c0f45',"+
		"'3c1d40465d944db2b722e49622c4a2f4',"+
		"'3daa5e30b875427a97d93d54deb20d42',"+
		"'a67c7b50e48d49c5843580bf06d9a7c3',"+
		"'f50ec8f58a92404cbddb9180f6c8cef7',"+
		"'5c1f033cfec040a08e63f0fbde872432',"+
		"'886c586c4c964043a7c64e2cde37a7fc',"+
		"'f482130541154bb190c739759b30b5c5',"+
		"'60e81c14dfbd4627b269bd4d3ec44c02',"+
		"'21e0754006db4bdf9e6c2ee366f85d84',"+
		"'b0cad7fbdf6346a1ad6d3fcac47268f6',"+
		"'3feaad21a49a4129adf703f908124f66',"+
		"'dedd90334ca64fafb04967859f20b41d',"+
		"'dedd90334ca64fafb04967859f20b41d',"+
		"'36a1cc269ea64649ab4867637541246c',"+
		"'9cd6479446644415bbb16a9cd22fc27e',"+
		"'40ef28461e29465cb514ef5c963eb5fc',"+
		"'c4403ab10da145eaab388a988ec779ef',"+
		"'c14eff06edd443cbaeaa41040925243d'";
                  
		return lineTxt;
	}
	 public static String replaceHost(String imgUrl) {
	        if (imgUrl != null) {
	            Pattern pattern = Pattern.compile("[a-zA-z]+://(.+?)/");
	            Matcher matcher = pattern.matcher(imgUrl);
	            imgUrl = matcher.replaceAll("");
//	            if(matcher.find()){
//	            	imgUrl = matcher.group();
	            	return imgUrl;
//	            }
	        }
	        return imgUrl;
	    }
}
