package com.to.cdp.info.service;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.XML;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.to.cdp.info.model.InfoCert;

@Service
@Transactional
public class InfoCertService {
	
	// infoCertDetail
	public InfoCert infoCertDetail(String jmCdForRec) {
		InfoCert infoCert = null;
		try {
			// JSONParser 객체 생성
			JSONParser jsonParser = new JSONParser();
			//JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser.parse(certXmlToJson());
//					System.out.println("jsonObject InfojobService : " + jsonObject);
			
			JSONObject response = (JSONObject) jsonObject.get("response");
			JSONObject body = (JSONObject) response.get("body");
			JSONObject items = (JSONObject) body.get("items");
			//item의 배열을 추출
			JSONArray certInfoArray = (JSONArray) items.get("item");
			System.out.println("jmCdCheck InfoCertService : " + jmCdForRec);
			
			for(int i=0; i<certInfoArray.size(); i++){
				String mdobligFldCd = "";
				String obligFldCd = "";
				String jmCd = "";
				String seriesCd = "";
				//배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
				JSONObject certObject = (JSONObject) certInfoArray.get(i);
				if (certObject.get("jmCd") instanceof Long) {
					jmCd = Long.toString((long) certObject.get("jmCd"));
					
				} else {
					jmCd = (String) certObject.get("jmCd");
				}
				if (certObject.get("mdobligFldCd") instanceof Long) {
					mdobligFldCd = Long.toString((long) certObject.get("mdobligFldCd"));
					
				} else {
					mdobligFldCd = (String) certObject.get("mdobligFldCd");
				}
				if (certObject.get("obligFldCd") instanceof Long) {
					obligFldCd = Long.toString((long) certObject.get("obligFldCd"));
					
				} else {
					obligFldCd = (String) certObject.get("obligFldCd");
				}
				if (certObject.get("seriesCd") instanceof Long) {
					seriesCd = Long.toString((long) certObject.get("seriesCd"));
					
				} else {
					seriesCd = (String) certObject.get("seriesCd");
				}
				//JSON name으로 추출
				if(jmCd.equals(jmCdForRec)){
					infoCert = new InfoCert();
					infoCert.setJmCd(jmCd); 
					infoCert.setJmFldNm((String) certObject.get("jmFldNm"));
					infoCert.setMdobligFldCd(mdobligFldCd);
					infoCert.setMdobligFldNm((String) certObject.get("mdobligFldNm"));
					infoCert.setObligFldCd(obligFldCd);
					infoCert.setObligFldNm((String) certObject.get("obligFldNm"));
					infoCert.setQualgbCd((String) certObject.get("qualgbCd"));
					infoCert.setQualgbNm((String) certObject.get("qualgbNm"));
					infoCert.setSeriesCd(seriesCd);
					infoCert.setSeriesNm((String) certObject.get("seriesNm"));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return infoCert;
	}
	
	
	// infoCertList
	public List<InfoCert> infoCertList(Map<String, Object> map) {
		List<InfoCert> infoCertList = null;
		InfoCert infoCert = null;
		try {
			infoCertList = new ArrayList<InfoCert>();
			// JSONParser 객체 생성
			JSONParser jsonParser = new JSONParser();
			//JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser.parse(certXmlToJson());
//					System.out.println("jsonObject InfojobService : " + jsonObject);
			
			JSONObject response = (JSONObject) jsonObject.get("response");
			JSONObject body = (JSONObject) response.get("body");
			JSONObject items = (JSONObject) body.get("items");
			//item의 배열을 추출
			JSONArray certInfoArray = (JSONArray) items.get("item");
			for(int i=0; i<certInfoArray.size(); i++){
				String mdobligFldCd = "";
				String obligFldCd = "";
				String jmCd = "";
				String seriesCd = "";
				//배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
				JSONObject certObject = (JSONObject) certInfoArray.get(i);
				if (certObject.get("jmCd") instanceof Long) {
					jmCd = Long.toString((long) certObject.get("jmCd"));
					
				} else {
					jmCd = (String) certObject.get("jmCd");
				}
				if (certObject.get("mdobligFldCd") instanceof Long) {
					mdobligFldCd = Long.toString((long) certObject.get("mdobligFldCd"));
					
				} else {
					mdobligFldCd = (String) certObject.get("mdobligFldCd");
				}
				if (certObject.get("obligFldCd") instanceof Long) {
					obligFldCd = Long.toString((long) certObject.get("obligFldCd"));
					
				} else {
					obligFldCd = (String) certObject.get("obligFldCd");
				}
				if (certObject.get("seriesCd") instanceof Long) {
					seriesCd = Long.toString((long) certObject.get("seriesCd"));
					
				} else {
					seriesCd = (String) certObject.get("seriesCd");
				}
				//JSON name으로 추출
				infoCert = new InfoCert();
				infoCert.setJmCd(jmCd); 
				infoCert.setJmFldNm((String) certObject.get("jmFldNm"));
				infoCert.setMdobligFldCd(mdobligFldCd);
				infoCert.setMdobligFldNm((String) certObject.get("mdobligFldNm"));
				infoCert.setObligFldCd(obligFldCd);
				infoCert.setObligFldNm((String) certObject.get("obligFldNm"));
				infoCert.setQualgbCd((String) certObject.get("qualgbCd"));
				infoCert.setQualgbNm((String) certObject.get("qualgbNm"));
				infoCert.setSeriesCd(seriesCd);
				infoCert.setSeriesNm((String) certObject.get("seriesNm"));
				infoCertList.add(infoCert);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return infoCertList;
	}
	
	// Xml Json으로 파싱 후 String으로 리스트 리턴
    public String certXmlToJson() throws Exception {
    	int INDENT_FACTOR = 4;
    	String addr = "http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList?";
    	String serviceKey = "ServiceKey=iiIPCftaospcNacczlYyiJ6OjWnAqGl8eHOOub2PR9NgT3yA8JIhUTDSATU4n9eFNH3NW3hx0Kyk26l2OYtUjA%3D%3D";
        
    	String parameter = "";
    	parameter = parameter + "&numOfRows=" + "10";
    	parameter = parameter + "&pageNo=" + "1";
    	
    	addr = addr + serviceKey + parameter;
    	HttpURLConnection conn = (HttpURLConnection) new URL(addr).openConnection();
        conn.connect();
        BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
        BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
        StringBuffer st = new StringBuffer();
        String line;
        while ((line = reader.readLine()) != null) {
            st.append(line);
        }
        // XML을 JSON으로 바꾸기
        org.json.JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
        //String 형식
        String infoCertListJson = xmlJSONObj.toString(INDENT_FACTOR);
        
//        System.out.println("infoCertListJson_String InfoCertService : " + infoCertListJson);
		return infoCertListJson;
    }
    
/*    
    // String형식의 데이터를 JSONObject형식으로 캐스팅 후 리턴
    public JSONObject infoCertListJson() throws Exception{
    	//JSONObject 형식
    	JSONParser jsonParser = new JSONParser();
    	JSONObject jsonObject = (JSONObject) jsonParser.parse(certXmlToJson());
		return jsonObject;
    }
*/	
/*	
	 public String readUrl() throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList"); URL
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=iiIPCftaospcNacczlYyiJ6OjWnAqGl8eHOOub2PR9NgT3yA8JIhUTDSATU4n9eFNH3NW3hx0Kyk26l2OYtUjA%3D%3D"); Service Key
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); 검색건수
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); 페이지 번호
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        
        System.out.println("Response code: " + conn.getResponseCode());
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        System.out.println("url_cert : " + sb);
        rd.close();
        conn.disconnect();
		return sb.toString();
    }
*/	 
	// infoCertDetail
	public InfoCert infoCertDetail(InfoCert infoCert){
		return null;
	}
}