package com.to.cdp.info.service;

import java.io.BufferedInputStream;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.model.InfoDept;

@Service
@Transactional
public class InfoDeptService {
	
// apiInfoDeptList(대학교)
	public List<InfoDept> infoDeptList(Map<String, Object> map) {
		List<InfoDept> infoDeptList = null;
		
		try {
			InfoDept infoDept = null;
			infoDeptList = new ArrayList<InfoDept>();
			// JSONParser 객체 생성
			JSONParser jsonParser = new JSONParser();
			//JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser.parse(readUrl());
//						System.out.println("jsonObject InfojobService : " + jsonObject);
			
			JSONObject json = (JSONObject) jsonObject.get("dataSearch");
			//item의 배열을 추출
			JSONArray deptInfoArray = (JSONArray) json.get("content");
			for(int i=0; i<deptInfoArray.size(); i++){
				infoDept = new InfoDept();
				//배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
				JSONObject deptObject = (JSONObject) deptInfoArray.get(i);
				//JSON name으로 추출
				infoDept.setTotalCount((String) deptObject.get("totalCount")); 
				infoDept.setMajorSeq((String) deptObject.get("majorSeq"));
				infoDept.setlClass((String) deptObject.get("lClass"));
				infoDept.setmClass((String) deptObject.get("mClass"));
				infoDept.setFacilName((String) deptObject.get("facilName"));
				infoDeptList.add(infoDept);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return infoDeptList;
	}
	
	// Xml Json으로 파싱 후 String으로 리스트 리턴
    public String readUrl() throws Exception {
	    	BufferedInputStream reader = null;
	    	
	    	String addr = "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=";
	    	String serviceKey = "e910704456fd613f346b478c1f558c9b";
	    	String parameter = "";
	    	
	    	parameter = parameter + "&svcType=" + "api";
			parameter = parameter + "&svcCode=" + "MAJOR";
			parameter = parameter + "&contentType=" + "json";
			parameter = parameter + "&gubun=" + "univ_list";
			parameter = parameter + "&perPage=" + "1000";
	    	
	    	addr = addr + serviceKey + parameter;
	    	System.out.println(addr);
	    	
	    	try{
				URL url = new URL(addr);
				reader = new BufferedInputStream(url.openStream());
				StringBuffer buffer = new StringBuffer();
				int i;
				byte[] b = new byte[4096];
				while( (i = reader.read(b)) != -1 ){
				buffer.append(new String(b, 0, i));
				}
				return buffer.toString();
			}finally{
	            if(reader != null){
	            	reader.close();
	            }
	        }
	    }
    
	// infoDeptDetail
	public InfoDept infoDeptDetail(String majorSepForCheck) {
		InfoDept infoDept = null;
		try {
			// JSONParser 객체 생성
			JSONParser jsonParser = new JSONParser();
			//JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser.parse(readUrl());
//						System.out.println("jsonObject InfojobService : " + jsonObject);
			
			JSONObject json = (JSONObject) jsonObject.get("dataSearch");
			//item의 배열을 추출
			JSONArray deptInfoArray = (JSONArray) json.get("content");
			for(int i=0; i<deptInfoArray.size(); i++){
				//배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
				JSONObject deptObject = (JSONObject) deptInfoArray.get(i);
				String majorSeq = (String) deptObject.get("majorSeq");
				if(majorSeq.equals(majorSepForCheck)) {
					infoDept = new InfoDept();
					//JSON name으로 추출
					infoDept.setTotalCount((String) deptObject.get("totalCount")); 
					infoDept.setMajorSeq((String) deptObject.get("majorSeq"));
					infoDept.setlClass((String) deptObject.get("lClass"));
					infoDept.setmClass((String) deptObject.get("mClass"));
					infoDept.setFacilName((String) deptObject.get("facilName"));
				}	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("infoDept infoDeptService : " + infoDept);
		return infoDept;
	}
}
