package com.to.cdp.info.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.to.cdp.PageHelper;
import com.to.cdp.info.dao.InfoJobDao;
import com.to.cdp.info.model.InfoJob;

@Service
@Transactional
public class InfoJobService {
	
	@Autowired
	private InfoJobDao infoJobDao;
	
	// apiInfoJobList
	public ArrayList<HashMap<String, Object>> parserJob(String searchType, String searchWord) throws ParserConfigurationException, UnsupportedEncodingException{
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
	
	public String restClient(String searchWord) throws Exception{
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
		
		//String parameter = "";
		
		// 키 값 encoding
//		servicekey = URLEncoder.encode(servicekey,"UTF-8");
		
		//parameter setting
		//parameter = parameter + "&" + "numOfRows=50";
		//parameter = parameter + "&" + "pageNo-1";
		
//		addr = addr + servicekey/* + parameter*/;
		
		URL url = new URL(addr);
		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
		String inLine;
		String xml="";
		while((inLine = in.readLine()) != null) xml=inLine;
		in.close();
		
		return xml;
	}
	
	// infoJobDetail
	public InfoJob infoJobDetail(InfoJob infoJob){
		System.out.println("infoJob InfoJobService : " + infoJob);
		
		return infoJob;
	}

}