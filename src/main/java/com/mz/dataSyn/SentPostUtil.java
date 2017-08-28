package com.mz.dataSyn;

import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSONObject;


public class SentPostUtil {

	public static String sendPost(String url, Map<String, Object> params) throws Exception {
		CloseableHttpClient client = HttpClients.createDefault();

        HttpPost httpPost = new HttpPost(url);
        httpPost.setHeader("Content-Type", "application/json;charset=utf-8");
        
        JSONObject jsonObject = (JSONObject) JSONObject.parse(params.toString());
//        logger.info("-------------------"+jsonObject);
        System.out.println("-------------------"+jsonObject);
        StringEntity se = new StringEntity(jsonObject.toString(),"UTF-8");
        se.setContentEncoding(new BasicHeader(HTTP.CONTENT_TYPE, "application/json"));   
        httpPost.setEntity(se);
        CloseableHttpResponse response = client.execute(httpPost);
      //返回数据
        HttpEntity entity = response.getEntity();
        String result = EntityUtils.toString(entity, "UTF-8");
//        logger.info("++++++++++++++++++++++"+result);
//        System.out.println("++++++++++++++++++++++"+result);
        return result;
	}
	
}
