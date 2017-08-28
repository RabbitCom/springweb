package com.feifan.dataSyn;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 * 
 * @author Xiaohui  Li
 *
 */
public class JDBCutil {

	
	public static Connection conn;
	public static Statement stmt;
	public static ResultSet rs;
	
	public static Connection getJDBCconn(){
		 String url = "jdbc:mysql://123.59.27.186:23306/cnlive_ffyl" ;    
	     String username = "ugc" ;   
	     String password = "liujicheng@cnlive.COM" ;   
	     try{   
	    	 conn =  DriverManager.getConnection(url , username , password ) ;   
	     }catch(SQLException se){   
	       se.printStackTrace() ;   
	     }   
	     return conn;
	}
	
	 
	 // 通过结果集元数据封装List结果集
    public static  List<Map<String, Object>>  read() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM t_material_file WHERE src_path LIKE '%.mp4%' AND online_path IS NOT NULL AND src_path NOT LIKE '%.mp4.%' AND auto_state = '2'  ORDER BY id limit 5000,100";
//        String sql = " SELECT * FROM t_material_file where uuid ='8744d15166dd42cc8599baba255a7ee5'";
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
                datas.add(content);
                content= null;
            }
            return datas;
        } catch (Exception e) {
            return null;
        } finally {
             free(rs, ps, conn);
        }
    }
	
//    
//    // 通过结果集元数据封装List结果集
//    public static  List<Integer>  getId() {
//    	List<Integer> idList = new ArrayList<Integer>();
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        String sql = " SELECT id  FROM t_material_file where uuid is null and create_time >='2017-02-04 03:14:12' order by id";
////        String sql = " SELECT id  FROM t_material_file where   id ="+78755;
////        String sql = "";
//        try {
//            conn = getJDBCconn();
//            ps = conn.prepareStatement(sql);
//            rs = ps.executeQuery();
//            
//            while (rs.next()) {
//            	 Integer id = rs.getInt("id");
//            	 idList.add(id);
//            	 id = null;
//            }
//            return idList;
//        } catch (Exception e) {
//            return null;
//        } finally {
//             free(rs, ps, conn);
//        }
//    }
    
    
//    public static void  updateData(int id){
//		     Connection conn = getJDBCconn(); 
//		     String sql = "update t_material_file set uuid=? where id=?"; 
//		     PreparedStatement ps = null; 
//		     try { 
//				ps = conn.prepareStatement(sql); 
//				ps.setString(1, getUUID());
//				ps.setInt(2, id);
//				int i = ps.executeUpdate(); 
//				if(i != 0){ 
//					System.out.println("完成");
//				} 
//			} catch (SQLException e) { 
//				e.printStackTrace(); 
//			} finally { 
//				free(null,ps,conn);
//			} 
//	}
    
    
    public static List<Map<String,Object>> getMapList(){
    	List<Map<String,Object>> mapList  =  read();
    	List<Map<String,Object>> fileList = new ArrayList<Map<String,Object>>();
    	for(Map<String,Object> map : mapList){
    		Map<String,Object> mapFile = new HashMap<String, Object>();
    		String title = (String) map.get("title");
    		String date = (String) map.get("create_time").toString();
    		String createTime = date.substring(0, date.indexOf("."));
    		String onlinePath = (String) map.get("online_path");
    		String fileSize = (String) map.get("file_size").toString();
    		String videoUUID = (String) map.get("uuid");
    		mapFile.put("videoName", title);
    		mapFile.put("createTime", createTime);
    		mapFile.put("originUri", onlinePath);
    		mapFile.put("videoUUID", videoUUID);
    		mapFile.put("fileSize", fileSize);
//    		mapFile.put("spId", 223);
    		mapFile.put("spId", 60);
    		mapFile.put("codeRate", 800);
    		mapFile.put("videoDes", "");
    		mapFile.put("resOrigin", "");
    		mapFile.put("sizeOrigin", "0.0");
    		mapFile.put("duration", "0");
    		mapFile.put("vbrOrigin", "");
    		mapFile.put("ratioOrigin", "");
    		mapFile.put("gfmt", "mp4");
    		mapFile.put("imgUrl", "http://y1.cnliveimg.com:8080/picture/1.jpg");
    		fileList.add(mapFile);
    		mapFile = null;
    	}
    	return fileList;
    }
    
    private String replaceHost(String imgUrl) {
        if (imgUrl != null) {
            Pattern pattern = Pattern.compile("[a-zA-z]+://(.+?)/");
            Matcher matcher = pattern.matcher(imgUrl);
            imgUrl = matcher.replaceAll("");
        }
        return imgUrl;
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
	
     
    public static String getUUID(){
    	UUID uuid = UUID.randomUUID();
    	String uuids = uuid.toString().replaceAll("\\-", "");
//    	String uuidd = uuid.toString().replaceAll("-", "");
    	return uuids;
    }
    
      
    public static void main(String[] args) {
//    	read();
    	
//    	getUUID();
    	
	}
    
    
}
