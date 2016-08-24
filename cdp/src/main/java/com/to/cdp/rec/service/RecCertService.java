package com.to.cdp.rec.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.model.InfoCert;
import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.service.InfoCertService;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.rec.dao.RecCertDao;
import com.to.cdp.rec.model.RecCert;
import com.to.cdp.rec.model.RecWithInfoCert;

import net.sf.json.JSONSerializer;



@Service
@Transactional
public class RecCertService {
	
	@Autowired
	private RecCertDao recCertDao;
	@Autowired
	private InfoCertService infoCertService;
	
	// recCertInsert
	public int recCertInsert(RecCert recCert){
		String recCertLastKey = "";
		String recCertCode = "";
		String recCertPre = "rec_cert_";
		
		recCertLastKey = recCertDao.recCertLastKey();
		
		int lastKeyNum = 0;
		if(recCertLastKey == null){
			lastKeyNum = lastKeyNum+1;
		}else{
			// resume_cert_을 제외한 번호만 뽑아내서 +1 시킴
			lastKeyNum = Integer.parseInt(recCertLastKey.substring(recCertPre.length()))+1;
		}
		
		// resume_school_번호 셋팅
		recCertCode = recCertPre + lastKeyNum;
		recCert.setRecCertCode(recCertCode);
		return recCertDao.recCertInsert(recCert);
	}
	
	// recCertUpdate
	public int recCertUpdate(RecCert recCert){
		return recCertDao.recCertUpdate(recCert);
	}
	
	// recCertDelete
	public int recCertDelete(RecCert recCert){
		return recCertDao.recCertDelete(recCert);
	}
	
	// recCertList
	public List<InfoCert> recCertList(Map<String, Object> map){
		List<InfoCert> infoCertList = null;
		try{
			InfoCert infoCert = null;
			infoCertList = new ArrayList<InfoCert>();
			net.sf.json.JSONArray recCertListJson = null;
			// JSONParser 객체 생성
			JSONParser jsonParser = new JSONParser();
			//JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser.parse(infoCertService.certXmlToJson());
			JSONObject response = (JSONObject) jsonObject.get("response");
			JSONObject body = (JSONObject) response.get("body");
			JSONObject items = (JSONObject) body.get("items");
			JSONArray certInfoArray = (JSONArray) items.get("item");
			System.out.println("certInfoArray RecCertService :::" + certInfoArray);
			Object recCertList = map.get("recCertListWithRecCertCondition");
			
			recCertListJson = net.sf.json.JSONArray.fromObject(JSONSerializer.toJSON(recCertList));
			System.out.println("recCertListJson RecCertService : " + recCertListJson);
			System.out.println("infoCertList RecCertService : " + infoCertList);
			
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
				
				if(recCertListJson != null){
					
					for(int j=0; j<recCertListJson.size(); j++){
						net.sf.json.JSONObject infoCertListJson = (net.sf.json.JSONObject) recCertListJson.get(j);
						String jmCdForRec = (String) infoCertListJson.get("jmCd");
						System.out.println("jmCdForRec RecCertService :::" + jmCdForRec);
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
							infoCertList.add(infoCert);
							System.out.println("infoCertList RecCertService ::: " + infoCertList);
						}
					}
				}
			}
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return infoCertList;
	}
	
	// recCertDetail
	public RecCert recCertDetail(RecCert recCert){
		return recCertDao.recCertDetail(recCert);
	}

	// ��õ�ڰ��� �� ����
	public int infoCertCountAtRec(Map<String, Object> map) {
		return recCertDao.infoCertCountAtRec(map);
	}

	// ��õ�ڰ�������Ʈ
	public List<RecCert> recCertListWithRecCertCondition(Map<String, Object> map) {
		return recCertDao.recCertListWithRecCertCondition(map);
	}

	public List<RecWithInfoCert> recWithInfoCertList(
			List<RecCert> recCertListWithRecCertCondition,
			List<InfoCert> infoCertListForRec) {
		
		List<RecWithInfoCert> recWithInfoCertList = new ArrayList<RecWithInfoCert>();
		RecCert recCert = new RecCert();
		InfoCert infoCert = new InfoCert();
		
		for(int i=0; i<recCertListWithRecCertCondition.size(); i++){
			RecWithInfoCert recWithInfoCert = new RecWithInfoCert();
			recCert = recCertListWithRecCertCondition.get(i);
			recWithInfoCert.setJmCd(recCert.getJmCd());
			recWithInfoCert.setJobdicSeq(recCert.getJobdicSeq());
			recWithInfoCert.setRecCertCode(recCert.getRecCertCode());
			recWithInfoCert.setRecCertCondition(recCert.getRecCertCondition());
			recWithInfoCert.setRecCertContent(recCert.getRecCertContent());
			recWithInfoCert.setRecCertReason(recCert.getRecCertReason());
			recWithInfoCert.setRecCertRegisterDate(recCert.getRecCertRegisterDate());
			for(int j=0; j<infoCertListForRec.size(); j++){
				infoCert = infoCertListForRec.get(j);
				if(recWithInfoCert.getJmCd().equals(infoCert.getJmCd())){
					recWithInfoCert.setJmFldNm(infoCert.getJmFldNm());
					recWithInfoCert.setMdobligFldCd(infoCert.getMdobligFldCd());
					recWithInfoCert.setMdobligFldNm(infoCert.getMdobligFldNm());
					recWithInfoCert.setObligFldCd(infoCert.getObligFldCd());
					recWithInfoCert.setObligFldNm(infoCert.getObligFldNm());
					recWithInfoCert.setQualgbCd(infoCert.getQualgbCd());
					recWithInfoCert.setQualgbNm(infoCert.getQualgbNm());
					recWithInfoCert.setSeriesCd(infoCert.getSeriesCd());
					recWithInfoCert.setSeriesNm(infoCert.getSeriesNm());
				}
			}
			recWithInfoCertList.add(recWithInfoCert);
		}
		return recWithInfoCertList;
	}

	public List<RecWithInfoCert> recCertListByAjax(PlanUnite planUnite) {
		List<RecWithInfoCert> recWithInfoCertList = recCertDao.recCertListByAjax(planUnite);
		return recWithInfoCertList;
	}
	// recCertListByAjax(info+rec)
	public List<RecWithInfoCert> infoCertListAtPlanUniteByAjax(List<RecWithInfoCert> recWithInfoCertList) {
		List<RecWithInfoCert> recInfoCertList = new ArrayList<RecWithInfoCert>();
		try{
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(infoCertService.certXmlToJson());
			JSONObject response = (JSONObject) jsonObject.get("response");
			JSONObject body = (JSONObject) response.get("body");
			JSONObject items = (JSONObject) body.get("items");
			JSONArray certInfoArray = (JSONArray) items.get("item");
			System.out.println("certInfoArray.size() RecCertService : " + certInfoArray.size());
			System.out.println("recWithInfoCertList.size() RecCertService : " + recWithInfoCertList.size());
			
			for(int j=0; j<recWithInfoCertList.size(); j++){
				RecWithInfoCert recWithInfoCert = new RecWithInfoCert();
				recWithInfoCert = recWithInfoCertList.get(j);
				String jmCdForCheck = recWithInfoCert.getJmCd();
				
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
					
					if(jmCd.equals(jmCdForCheck)){
						recWithInfoCert.setJmCd(jmCd); 
						recWithInfoCert.setJmFldNm((String) certObject.get("jmFldNm"));
						recWithInfoCert.setMdobligFldCd(mdobligFldCd);
						recWithInfoCert.setMdobligFldNm((String) certObject.get("mdobligFldNm"));
						recWithInfoCert.setObligFldCd(obligFldCd);
						recWithInfoCert.setObligFldNm((String) certObject.get("obligFldNm"));
						recWithInfoCert.setQualgbCd((String) certObject.get("qualgbCd"));
						recWithInfoCert.setQualgbNm((String) certObject.get("qualgbNm"));
						recWithInfoCert.setSeriesCd(seriesCd);
						recWithInfoCert.setSeriesNm((String) certObject.get("seriesNm"));
						recInfoCertList.add(recWithInfoCert);
						System.out.println("infoCertList RecCertService ::: " + recWithInfoCert);
					}
				}
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recInfoCertList;
	}

	// 자격증추천이유,내용 가져오기
	public RecCert recCertReason(RecCert recCert) {
		return recCertDao.recCertReason(recCert);
	}

}