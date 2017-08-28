package com.mz.dataSyn;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class DataSynJob {
	public static void main(String[] args) throws Exception {
		 List<Map<String,Object>> videoList = JDBCUtil.getBaseList();
		 ExecutorService  pool =Executors.newFixedThreadPool(5);
		 int a = 0;
//		 System.out.println(videoList.size());
    	 for(int i = 0; i < videoList.size(); i++){
//			 
    		 if(!pool.isShutdown()){
    			pool.submit(new synThread(videoList.get(i)));
    		 }
    		 if(i == videoList.size()-1){
				 pool.shutdown();
			 } 
    		
//    		 List<Map<String, Object>> videoFiles = JDBCUtil.getDataOne(videoList.get(i));
//			 if(videoFiles != null )
//			 {
//				 a++;
//			 }
    	 }
//		 System.out.println(a);
	}
	
}
