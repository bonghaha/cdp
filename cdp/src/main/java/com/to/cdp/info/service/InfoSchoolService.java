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

import com.to.cdp.info.model.InfoSchool;

@Service
@Transactional
public class InfoSchoolService {
	
	// apiInfoSchoolList(대학교)
	public List<InfoSchool> infoSchoolList(Map<String, Object> map){
		List<InfoSchool> infoSchoolList = null;
		InfoSchool infoSchool = null;
		try {
			infoSchoolList = new ArrayList<InfoSchool>();
			// JSONParser 객체 생성
			JSONParser jsonParser = new JSONParser();
			//JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser.parse(readUrl());
//			System.out.println("readUrl_school : " + readUrl());
//			System.out.println("jsonObject InfoSchoolService : " + jsonObject);
			
			JSONObject json =  (JSONObject) jsonObject.get("dataSearch");
			//content의 배열을 추출
			JSONArray schoolInfoArray = (JSONArray) json.get("content");
//			System.out.println("schoolInfoArray InfoSchoolService : " + schoolInfoArray);

			for(int i=0; i<schoolInfoArray.size(); i++){
				infoSchool = new InfoSchool();
				//배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
				JSONObject schoolObject = (JSONObject) schoolInfoArray.get(i);
				//JSON name으로 추출
				infoSchool.setSeq((String) schoolObject.get("seq"));
				infoSchool.setTotalCount((String) schoolObject.get("totalCount")); 
				infoSchool.setSchoolName((String) schoolObject.get("schoolName"));
				infoSchool.setSchoolGubun((String) schoolObject.get("schoolGubun"));
				infoSchool.setSchoolType((String) schoolObject.get("schoolType"));
				infoSchool.setEstType((String) schoolObject.get("estType"));
				infoSchool.setRegion((String) schoolObject.get("region"));
				infoSchool.setAdres((String) schoolObject.get("adres"));
				infoSchool.setCollegeinfourl((String) schoolObject.get("collegeinfourl"));
				infoSchool.setLink((String) schoolObject.get("link"));
				infoSchoolList.add(infoSchool);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return infoSchoolList;
	}

	public String readUrl() throws Exception{
		BufferedInputStream reader = null;
		
		String addr = "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=";
		String servicekey = "e910704456fd613f346b478c1f558c9b";
		String parameter = "";
		parameter = parameter + "&svcType=" + "api";
		parameter = parameter + "&svcCode=" + "SCHOOL";
		parameter = parameter + "&contentType=" + "json";
		parameter = parameter + "&gubun=" + "univ_list";
		parameter = parameter + "&perPage=" + "8000";
		
//		System.out.println("searchWord InfoJobService : " + searchWord);
		/*if(searchWord != ""){
			parameter = parameter + "&" + "searchJobNm=" + searchWord;
		}*/
		
		addr = addr + servicekey + parameter;
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
	
	// infoSchoolDetail
	public InfoSchool infoSchoolDetail(String seqForCheck){
		InfoSchool infoSchool = null;
		try {
			// JSONParser 객체 생성
			JSONParser jsonParser = new JSONParser();
			//JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser.parse(readUrl());
			System.out.println("readUrl_school : " + readUrl());
//			System.out.println("jsonObject InfoSchoolService : " + jsonObject);
			
			JSONObject json =  (JSONObject) jsonObject.get("dataSearch");
			//books의 배열을 추출
			JSONArray schoolInfoArray = (JSONArray) json.get("content");
//			System.out.println("schoolInfoArray InfoSchoolService : " + schoolInfoArray);
			for(int i=0; i<schoolInfoArray.size(); i++){
				//배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
				JSONObject schoolObject = (JSONObject) schoolInfoArray.get(i);
				String seq = (String) schoolObject.get("seq");
				if(seq.equals(seqForCheck)){
					infoSchool = new InfoSchool();
					//JSON name으로 추출
					infoSchool.setSeq((String) schoolObject.get("seq"));
					infoSchool.setTotalCount((String) schoolObject.get("totalCount")); 
					infoSchool.setSchoolName((String) schoolObject.get("schoolName"));
					infoSchool.setSchoolGubun((String) schoolObject.get("schoolGubun"));
					infoSchool.setSchoolType((String) schoolObject.get("schoolType"));
					infoSchool.setEstType((String) schoolObject.get("estType"));
					infoSchool.setRegion((String) schoolObject.get("region"));
					infoSchool.setAdres((String) schoolObject.get("adres"));
					infoSchool.setCollegeinfourl((String) schoolObject.get("collegeinfourl"));
					infoSchool.setLink((String) schoolObject.get("link"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return infoSchool;
	}
	
}