package com.to.cdp.info.service;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.model.InfoMember;

@Service
@Transactional
public class InfoJobService {
	
	// apiInfoDeptList(대학교)
	public ArrayList<InfoJob> infoJobList(String searchType, String searchWord) {
		ArrayList<InfoJob> infoJobList = new ArrayList<InfoJob>();
		
		try {
			// JSONParser 객체 생성
			JSONParser jsonParser = new JSONParser();
			//JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser.parse(readUrl());
			
			JSONObject json =  (JSONObject) jsonObject.get("dataSearch");
			//books의 배열을 추출
			JSONArray jobInfoArray = (JSONArray) json.get("content");
			System.out.println("searchType infoJobList() : " + searchType);
			System.out.println("searchWord infoJobList() : " + searchWord);
			
			for(int i=0; i<jobInfoArray.size(); i++){
				InfoJob infoJob = null;
				//배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
				JSONObject jobObject = (JSONObject) jobInfoArray.get(i);
				
				
				//조건검색 어케 줄여야 하지..???
				if(searchType.equals("job")){
					if(((String) jobObject.get("job")).contains(searchWord)){
						infoJob = new InfoJob();
						infoJob.setTotalCount((String) jobObject.get("totalCount")); 
						infoJob.setJobCode((String) jobObject.get("job_code"));
						infoJob.setJobdicSeq((String) jobObject.get("jobdicSeq"));
						infoJob.setJob((String) jobObject.get("job"));
						infoJob.setProfession((String) jobObject.get("profession"));
						infoJob.setAptdTypeCode((String) jobObject.get("aptd_type_code"));
						infoJob.setJobCtgCode((String) jobObject.get("job_ctg_code"));
						infoJob.setSummary((String) jobObject.get("summary"));
						infoJob.setSimilarJob((String) jobObject.get("similarJob"));
						infoJob.setEqualemployment((String) jobObject.get("equalemployment"));
						infoJob.setPossibility((String) jobObject.get("possibility"));
						infoJob.setProspect((String) jobObject.get("prospect"));
						infoJob.setSalery((String) jobObject.get("salery"));
						infoJobList.add(infoJob);
					}
				}else if(searchType.equals("profession")){
					if(((String) jobObject.get("profession")).contains(searchWord)){
						infoJob = new InfoJob();
						infoJob.setTotalCount((String) jobObject.get("totalCount")); 
						infoJob.setJobCode((String) jobObject.get("job_code"));
						infoJob.setJobdicSeq((String) jobObject.get("jobdicSeq"));
						infoJob.setJob((String) jobObject.get("job"));
						infoJob.setProfession((String) jobObject.get("profession"));
						infoJob.setAptdTypeCode((String) jobObject.get("aptd_type_code"));
						infoJob.setJobCtgCode((String) jobObject.get("job_ctg_code"));
						infoJob.setSummary((String) jobObject.get("summary"));
						infoJob.setSimilarJob((String) jobObject.get("similarJob"));
						infoJob.setEqualemployment((String) jobObject.get("equalemployment"));
						infoJob.setPossibility((String) jobObject.get("possibility"));
						infoJob.setProspect((String) jobObject.get("prospect"));
						infoJob.setSalery((String) jobObject.get("salery"));
						infoJobList.add(infoJob);
					}
				}else if(searchType.equals("equalemployment")){
					if(((String) jobObject.get("equalemployment")).contains(searchWord)){
						infoJob = new InfoJob();
						infoJob.setTotalCount((String) jobObject.get("totalCount")); 
						infoJob.setJobCode((String) jobObject.get("job_code"));
						infoJob.setJobdicSeq((String) jobObject.get("jobdicSeq"));
						infoJob.setJob((String) jobObject.get("job"));
						infoJob.setProfession((String) jobObject.get("profession"));
						infoJob.setAptdTypeCode((String) jobObject.get("aptd_type_code"));
						infoJob.setJobCtgCode((String) jobObject.get("job_ctg_code"));
						infoJob.setSummary((String) jobObject.get("summary"));
						infoJob.setSimilarJob((String) jobObject.get("similarJob"));
						infoJob.setEqualemployment((String) jobObject.get("equalemployment"));
						infoJob.setPossibility((String) jobObject.get("possibility"));
						infoJob.setProspect((String) jobObject.get("prospect"));
						infoJob.setSalery((String) jobObject.get("salery"));
						infoJobList.add(infoJob);
					}
				}else if(searchType.equals("possibility")){
					if(((String) jobObject.get("possibility")).contains(searchWord)){
						infoJob = new InfoJob();
						infoJob.setTotalCount((String) jobObject.get("totalCount")); 
						infoJob.setJobCode((String) jobObject.get("job_code"));
						infoJob.setJobdicSeq((String) jobObject.get("jobdicSeq"));
						infoJob.setJob((String) jobObject.get("job"));
						infoJob.setProfession((String) jobObject.get("profession"));
						infoJob.setAptdTypeCode((String) jobObject.get("aptd_type_code"));
						infoJob.setJobCtgCode((String) jobObject.get("job_ctg_code"));
						infoJob.setSummary((String) jobObject.get("summary"));
						infoJob.setSimilarJob((String) jobObject.get("similarJob"));
						infoJob.setEqualemployment((String) jobObject.get("equalemployment"));
						infoJob.setPossibility((String) jobObject.get("possibility"));
						infoJob.setProspect((String) jobObject.get("prospect"));
						infoJob.setSalery((String) jobObject.get("salery"));
						infoJobList.add(infoJob);
					}
				}else if(searchType.equals("prospect")){
					if(((String) jobObject.get("prospect")).contains(searchWord)){
						infoJob = new InfoJob();
						infoJob.setTotalCount((String) jobObject.get("totalCount")); 
						infoJob.setJobCode((String) jobObject.get("job_code"));
						infoJob.setJobdicSeq((String) jobObject.get("jobdicSeq"));
						infoJob.setJob((String) jobObject.get("job"));
						infoJob.setProfession((String) jobObject.get("profession"));
						infoJob.setAptdTypeCode((String) jobObject.get("aptd_type_code"));
						infoJob.setJobCtgCode((String) jobObject.get("job_ctg_code"));
						infoJob.setSummary((String) jobObject.get("summary"));
						infoJob.setSimilarJob((String) jobObject.get("similarJob"));
						infoJob.setEqualemployment((String) jobObject.get("equalemployment"));
						infoJob.setPossibility((String) jobObject.get("possibility"));
						infoJob.setProspect((String) jobObject.get("prospect"));
						infoJob.setSalery((String) jobObject.get("salery"));
						infoJobList.add(infoJob);
					}
				}else if(searchType.equals("salery")){
					if(((String) jobObject.get("salery")).contains(searchWord)){
						infoJob = new InfoJob();
						infoJob.setTotalCount((String) jobObject.get("totalCount")); 
						infoJob.setJobCode((String) jobObject.get("job_code"));
						infoJob.setJobdicSeq((String) jobObject.get("jobdicSeq"));
						infoJob.setJob((String) jobObject.get("job"));
						infoJob.setProfession((String) jobObject.get("profession"));
						infoJob.setAptdTypeCode((String) jobObject.get("aptd_type_code"));
						infoJob.setJobCtgCode((String) jobObject.get("job_ctg_code"));
						infoJob.setSummary((String) jobObject.get("summary"));
						infoJob.setSimilarJob((String) jobObject.get("similarJob"));
						infoJob.setEqualemployment((String) jobObject.get("equalemployment"));
						infoJob.setPossibility((String) jobObject.get("possibility"));
						infoJob.setProspect((String) jobObject.get("prospect"));
						infoJob.setSalery((String) jobObject.get("salery"));
						infoJobList.add(infoJob);
					}
				}else{
					infoJob = new InfoJob();
					//JSON name으로 추출
					infoJob.setTotalCount((String) jobObject.get("totalCount")); 
					infoJob.setJobCode((String) jobObject.get("job_code"));
					infoJob.setJobdicSeq((String) jobObject.get("jobdicSeq"));
					infoJob.setJob((String) jobObject.get("job"));
					infoJob.setProfession((String) jobObject.get("profession"));
					infoJob.setAptdTypeCode((String) jobObject.get("aptd_type_code"));
					infoJob.setJobCtgCode((String) jobObject.get("job_ctg_code"));
					infoJob.setSummary((String) jobObject.get("summary"));
					infoJob.setSimilarJob((String) jobObject.get("similarJob"));
					infoJob.setEqualemployment((String) jobObject.get("equalemployment"));
					infoJob.setPossibility((String) jobObject.get("possibility"));
					infoJob.setProspect((String) jobObject.get("prospect"));
					infoJob.setSalery((String) jobObject.get("salery"));
					infoJobList.add(infoJob);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("infoJobList.size() infoJobList() : " + infoJobList.size());
		return infoJobList;
	}
	

	// url읽기
	public String readUrl() throws Exception{
		BufferedInputStream reader = null;
		String addr = "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=";
		String servicekey = "e910704456fd613f346b478c1f558c9b";
		String parameter = "";
		parameter = parameter + "&svcType=" + "api";
		parameter = parameter + "&svcCode=" + "JOB";
		parameter = parameter + "&contentType=" + "json";
		parameter = parameter + "&gubun=" + "job_dic_list";
		parameter = parameter + "&perPage=" + "1000";
		
//			System.out.println("searchWord InfoJobService : " + searchWord);
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
		
/*	
	// apiInfoJobList
	public ArrayList<HashMap<String, Object>> infoJobList1(String searchType, String searchWord) throws ParserConfigurationException, UnsupportedEncodingException{
		ArrayList<HashMap<String, Object>> infoJobList = new ArrayList<HashMap<String, Object>>();
		
		String addr = "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=";
		String servicekey = "e910704456fd613f346b478c1f558c9b&svcType=api&svcCode=JOB&contentType=xml&gubun=job_dic_list&perPage=1000";
		String parameter = "";
		//String perPage = "";
		System.out.println("searchWord InfoJobService : " + searchWord);
		if(searchWord != ""){
			parameter = parameter + "&" + "searchJobNm=" + searchWord;
		}
		//parameter setting
		//parameter = parameter + "&" + "numOfRows=50";
		//parameter = parameter + "&" + "pageNo-1";
		
		addr = addr + servicekey + parameter;
		System.out.println(addr);
		
		// DocumentBuilderFactory를 이용해서 DocumentBuilder 클래스 객체화
		DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
		DocumentBuilder parser = f.newDocumentBuilder();
		
		//파싱
		Document xmlDoc = null;
		String paseUrl = addr;
		try {
			xmlDoc = parser.parse(paseUrl);
		} catch(SAXException | IOException e){
			e.printStackTrace();
		}
		
		// 파싱된 XML 문서의 루트 엘리먼트 획득
		Element root = xmlDoc.getDocumentElement();
		
		// 태그명 이용하여 job노드의 개수 구함
		int length = root.getElementsByTagName("job").getLength();
		for(int i=0; i<length; i++){
			HashMap<String,Object> parseMap = new HashMap<String, Object>();

			// 검색조건 비교하고 파싱한 값 등록하기
			String valForCompare = root.getElementsByTagName("job").item(i).getNodeName();
//			String valInfoJob = infoJob.getNodeName();	// job
			System.out.println("valForCompare InfoJobService :" + valForCompare);
			System.out.println("searchType InfoJobService : " + searchType);
			System.out.println("root.getElementsByTagName('job').item(i) InfoJobService : " + root.getElementsByTagName("job").item(i));
			System.out.println("searchWord InfoJobService : " + searchWord);
			
			if(valForCompare.contains(searchType)){
				if(root.getElementsByTagName("job").item(i).getTextContent().contains(searchWord)){
					System.out.println("valInfoJob 값 비교 if문 실행");
					// 태그명을 이용하여 노드리스트 획득
					Node infoJob = root.getElementsByTagName("job").item(i);
					Node infoJobdicSeq = root.getElementsByTagName("jobdicSeq").item(i);
					Node infoJobCode = root.getElementsByTagName("job_code").item(i);
					Node infoSummary = root.getElementsByTagName("summary").item(i);
					Node infoSimilarJob = root.getElementsByTagName("similarJob").item(i);
					Node infoEqualemployment = root.getElementsByTagName("equalemployment").item(i);
					Node infoPossibility = root.getElementsByTagName("possibility").item(i);
					Node infoProspect = root.getElementsByTagName("prospect").item(i);
					Node infoSalery = root.getElementsByTagName("salery").item(i);
					Node infoJobCtgCode = root.getElementsByTagName("job_ctg_code").item(i);
					Node infoAptdTypeCode = root.getElementsByTagName("aptd_type_code").item(i);
					Node infoProfession = root.getElementsByTagName("profession").item(i);
					
					parseMap.put("infoJob", infoJob.getTextContent());
					parseMap.put("infoJobdicSeq", infoJobdicSeq.getTextContent());
					parseMap.put("infoJobCode", infoJobCode.getTextContent());
					parseMap.put("infoSummary", infoSummary.getTextContent());
					parseMap.put("infoSimilarJob", infoSimilarJob.getTextContent());
					parseMap.put("infoEqualemployment", infoEqualemployment.getTextContent());
					parseMap.put("infoPossibility", infoPossibility.getTextContent());
					parseMap.put("infoProspect", infoProspect.getTextContent());
					parseMap.put("infoSalery", infoSalery.getTextContent());
					parseMap.put("infoJobCtgCode", infoJobCtgCode.getTextContent());
					parseMap.put("infoAptdTypeCode", infoAptdTypeCode.getTextContent());
					parseMap.put("infoProfession", infoProfession.getTextContent());
					infoJobList.add(parseMap);
				}
			}
		}
		return infoJobList;
	}
*/	
	
//	
//	public String restClient(String searchWord) throws Exception{
//		String addr = "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=";
//		String servicekey = "e910704456fd613f346b478c1f558c9b&svcType=api&svcCode=JOB&contentType=xml&gubun=job_dic_list&perPage=1000";
//		String parameter = "";
//		//String perPage = "";
//		System.out.println("searchWord InfoJobService : " + searchWord);
//		
//		if(searchWord != ""){
//			parameter = parameter + "&" + "searchJobNm=" + searchWord;
//		}
//		//parameter setting
//		//parameter = parameter + "&" + "numOfRows=50";
//		//parameter = parameter + "&" + "pageNo-1";
//		
//		addr = addr + servicekey + parameter;
//		
//		//String parameter = "";
//		
//		// 키 값 encoding
////		servicekey = URLEncoder.encode(servicekey,"UTF-8");
//		
//		//parameter setting
//		//parameter = parameter + "&" + "numOfRows=50";
//		//parameter = parameter + "&" + "pageNo-1";
//		
////		addr = addr + servicekey/* + parameter*/;
//		
//		URL url = new URL(addr);
//		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
//		String inLine;
//		String xml="";
//		while((inLine = in.readLine()) != null) xml=inLine;
//		in.close();
//		return xml;
//	}
//	
	// infoJobDetail
	public InfoJob infoJobDetail(InfoJob infoJob){
		
		try {
			// JSONParser 객체 생성
			JSONParser jsonParser = new JSONParser();
			//JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser.parse(readUrl());
			
			JSONObject json =  (JSONObject) jsonObject.get("dataSearch");
			//books의 배열을 추출
			JSONArray jobInfoArray = (JSONArray) json.get("content");
			String jobdicSeqForDetail = infoJob.getJobdicSeq();
//			System.out.println("jobdicSeqForDetail InfoJobService : " + jobdicSeqForDetail);
			
			for(int i=0; i<jobInfoArray.size(); i++){
				//배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
				JSONObject jobObject = (JSONObject) jobInfoArray.get(i);
				String jobDicSeq = (String) jobObject.get("jobdicSeq");
				
				if(jobDicSeq.equals(jobdicSeqForDetail)){
//					System.out.println("jobCode InfoJobService : " + jobDicSeq);
					infoJob = new InfoJob();
					//JSON name으로 추출
					infoJob.setTotalCount((String) jobObject.get("totalCount")); 
					infoJob.setJobCode((String) jobObject.get("job_code"));
					infoJob.setJobdicSeq((String) jobObject.get("jobdicSeq"));
					infoJob.setJob((String) jobObject.get("job"));
					infoJob.setProfession((String) jobObject.get("profession"));
					infoJob.setAptdTypeCode((String) jobObject.get("aptd_type_code"));
					infoJob.setJobCtgCode((String) jobObject.get("job_ctg_code"));
					infoJob.setSummary((String) jobObject.get("summary"));
					infoJob.setSimilarJob((String) jobObject.get("similarJob"));
					infoJob.setEqualemployment((String) jobObject.get("equalemployment"));
					infoJob.setPossibility((String) jobObject.get("possibility"));
					infoJob.setProspect((String) jobObject.get("prospect"));
					infoJob.setSalery((String) jobObject.get("salery"));
//					System.out.println("infoJob InfoJobService : " + infoJob);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return infoJob;
	}
}