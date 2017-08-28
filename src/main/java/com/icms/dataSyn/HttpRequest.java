package com.icms.dataSyn;

import java.util.Map;

import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import com.alibaba.fastjson.JSONObject;


public class HttpRequest {

	public static String sendPost(String url, Map<String, Object> params) throws Exception {
		CloseableHttpClient client = HttpClients.createDefault();

        HttpPost httpPost = new HttpPost(url);
        httpPost.setHeader("Content-Type", "application/json;charset=utf-8");
        
        JSONObject jsonObject = (JSONObject) JSONObject.parse(params.toString());
        System.out.println(jsonObject.toString());
//       StringEntity se = new StringEntity(jsonObject.toString(),"UTF-8");
//       se.setContentEncoding(new BasicHeader(HTTP.CONTENT_TYPE, "application/json"));   
//       httpPost.setEntity(se);
//       CloseableHttpResponse response = client.execute( httpPost);
//     //返回数据
//       HttpEntity entity = response.getEntity();
//       String result = EntityUtils.toString(entity, "UTF-8");
//       System.out.println(result);
        return  "";
	}
	
}
