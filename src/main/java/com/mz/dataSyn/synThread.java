package com.mz.dataSyn;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

//import net.sf.json.JSONObject;

class  synThread extends Thread{
		
//		private static final String synUrl = "http://10.10.40.91:8080/v1/inner/DataSyn/icms2mam";
//		private static final String synUrl = "http://mam.innerapi.cnlive.com/v1/inner/DataSyn/icms2mam?platform=ICMS&token=bf16f7b5bcb602f617c6624b83eaa7f6";
		private static final String synUrl = "http://test.mam.innerapi.cnlive.com/v1/inner/DataSyn/icms2mam?platform=ICMS&token=bf16f7b5bcb602f617c6624b83eaa7f6";
		
		private Map<String,Object> map = new HashMap<String, Object>();
		
		synThread(Map<String,Object> map){
			this.map = map;
		}
		
		@Override
		public void run() {
			 Map<String ,Object> params = new HashMap<String ,Object>();
			 List<Map<String, Object>> videoFiles = JDBCUtil.getDataOne(map);
			 if(videoFiles != null && videoFiles.size()>1){
				 params = JDBCUtil.getDataMap(videoFiles);
				 if(params != null){
					 try {
							String result = SentPostUtil.sendPost(synUrl, params);
							
							JSONObject  jasonObject = (JSONObject) JSONObject.parse(result);
							Map<String, Object> resMap = new HashMap<String, Object>();
							resMap = (Map)jasonObject;
							
							 if(Integer.parseInt(resMap.get("code").toString())==0){
								 System.out.println("++++++++++++++++++++++"+result);
						       }else {
						        	JDBCUtil.adderrData(map.get("id").toString(), resMap.get("msg").toString());
						       }
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
				 }
				 
			 }
			
		}
	}