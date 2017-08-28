package com.feifan.dataSyn;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.mz.dataSyn.JDBCUtil;
import com.mz.dataSyn.SentPostUtil;

//import net.sf.json.JSONObject;

public class FeiFanThread extends Thread{

//	private static final String synUrl = "http://test.mam.innerapi.cnlive.com/v1/inner/DataSyn/icms2mam?platform=ICMS&token=bf16f7b5bcb602f617c6624b83eaa7f6";
//	private static final String synUrl = "http://mam.innerapi.cnlive.com/v1/inner/DataSyn/icms2mam?platform=ICMS&token=bf16f7b5bcb602f617c6624b83eaa7f6";
	private static final String synUrl = "http://10.10.40.91:8080/v1/inner/DataSyn/icms2mam";
	
	private  Map<String , Object> map = new HashMap<String, Object>();
	
	FeiFanThread(Map<String , Object> map){
		this.map = map;
	}
	
	@Override
	public void run() {
		 try {
				String result = SentPostUtil.sendPost(synUrl, map);
				
				JSONObject  jasonObject = JSONObject.parseObject(result);
				Map<String, Object> resMap = new HashMap<String, Object>();
				resMap = (Map)jasonObject;
				
				 if(Integer.parseInt(resMap.get("code").toString())==0){
					 System.out.println("++++++++++++++++++++++"+result);
			       }else {
			    	   System.out.println(resMap.toString());
			        	JDBCUtil.adderrData(map.get("videoUUID").toString(), resMap.get("msg").toString());
			       }
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
