package com.icms.dataSyn;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class icmsDataJob extends Thread{

	private Map<String,Object>  map;
	
//	private String dataSynUrl = "http://mam.innerapi.cnlive.com/v1/inner/DataSyn/icms2mam?platform=ICMS&token=bf16f7b5bcb602f617c6624b83eaa7f6";
//	private String dataSynUrl = "http://test.mam.innerapi.cnlive.com/v1/inner/DataSyn/icms2mam?platform=ICMS&token=bf16f7b5bcb602f617c6624b83eaa7f6";
	private String dataSynUrl = "http://10.10.40.91:8080/v1/inner/DataSyn/icms2mam";
	
	
	public icmsDataJob(Map<String,Object>  map) {
		this.map = map;
	}
	
	@Override
	public void run() {
			Map<String,Object> programMap = new HashMap<String,Object>();
		 	String id = map.get("id").toString();
		 	String videoUUID = map.get("vpb_encrypt_id").toString();
		 	String videoName = map.get("title").toString();
		 	String duration = map.get("duration").toString();
		 	String videoDes = map.get("describe").toString();
		 	String subTitle = map.get("sub_title").toString();
		 	String createTime = map.get("create_time").toString();
//		 	String sizeOrigin = map.get("").toString();
		 	String originUri = map.get("source_path").toString();
		 	String url = JDBCUTil.replaceHost(originUri);
//		 	String storageId = map.get("").toString();//新添字段
			
		 	List<Map<String, Object>> fileMap = JDBCUTil.readFile(id);
		 	Map<String, Object> map =  JDBCUTil.getFileInfo(fileMap);
		 	@SuppressWarnings("unchecked")
			List<Map<String,Object>> imgInfos = (List<Map<String, Object>>) map.get("imgInfos");
		 	@SuppressWarnings("unchecked")
			List<Map<String,Object>> playInfos = (List<Map<String, Object>>) map.get("playInfos");
		 	
			programMap.put("videoUUID", videoUUID);
			programMap.put("videoName", videoName);
			programMap.put("duration", duration);
			programMap.put("videoDes", videoDes);
			programMap.put("imgInfos", imgInfos);
			programMap.put("spid", 117);
//			programMap.put("spid", Integer.parseInt(spid));
			programMap.put("playInfos", playInfos);
			programMap.put("subTitle", subTitle);
			programMap.put("createTime", createTime);
//			programMap.put("sizeOrigin", sizeOrigin);
			programMap.put("originUri", url);
			programMap.put("storageId", 109);
			programMap.put("storageImgId", 110);
			
			//XXX 数据同步接口调用
//			System.out.println(playInfos.toString());
			try {
					String result = HttpRequest.sendPost(dataSynUrl, programMap);
			} catch (Exception e) {
				
			}
	}
	
}
