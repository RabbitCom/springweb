package com.feifan.dataSyn;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class FeiFanSynJob {

	public static void main(String[] args) {
		List<Map<String,Object>> mapList = JDBCutil.getMapList();
//		System.out.println(mapList.size());
		 ExecutorService  pool =Executors.newFixedThreadPool(5);
		 for(int i = 0 ; i < mapList.size() ; i++){
				 if(!pool.isShutdown()){
					 pool.submit(new FeiFanThread(mapList.get(i)));
				 }
	    		 if(i == mapList.size()-1){
					 pool.shutdown();
				 }  
			 
			 
		 }
		 
//		 String synUrl = "http://10.10.40.91:8080/v1/inner/DataSyn/icms2mam";
//		 for(Map<String,Object> map:mapList){
//			 try {
//				String result = SentPostUtil.sendPost(synUrl, map);
//				JSONObject  jasonObject = JSONObject.fromObject(result);
//				Map<String, Object> resMap = new HashMap<String, Object>();
//				resMap = (Map)jasonObject;
//				
//				 if(Integer.parseInt(resMap.get("code").toString())==0){
//					 System.out.println("++++++++++++++++++++++"+result);
//			       }else {
//			    	   System.out.println(resMap.toString());
//			        	JDBCUtil.adderrData(map.get("videoUUID").toString(), resMap.get("msg").toString());
//			       }
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		 }
		
	}
	
}
