package com.to.cdp.rec.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.model.InfoSchool;
import com.to.cdp.info.service.InfoSchoolService;
import com.to.cdp.plan.model.PlanSchool;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.rec.dao.RecSchoolDao;
import com.to.cdp.rec.model.RecSchool;
import com.to.cdp.rec.model.RecWithInfoSchool;

import net.sf.json.JSONSerializer;


@Service
@Transactional
public class RecSchoolService {
	
	@Autowired
	private RecSchoolDao recSchoolDao;
	@Autowired
	private InfoSchoolService infoSchoolService;
	
	// recSchoolInsert
	public int recSchoolInsert(RecSchool recSchool) {
		String recSchoolLastKey = "";
		String recSchoolCode = "";
		String recSchoolPre = "rec_school_";
		// 마지막으로 생성된 resume_school_code 번호 select
		recSchoolLastKey = recSchoolDao.recSchoolLastKey();
		
		int lastKeyNum = 0;
		if(recSchoolLastKey == null){
			lastKeyNum = lastKeyNum+1;
		}else{
			// resume_school_을 제외한 번호만 뽑아내서 +1 시킴
			lastKeyNum = Integer.parseInt(recSchoolLastKey.substring(recSchoolPre.length()))+1;
		}
		
		// resume_school_번호 셋팅
		recSchoolCode = recSchoolPre + lastKeyNum;
		recSchool.setRecSchoolCode(recSchoolCode);
		return recSchoolDao.recSchoolInsert(recSchool);
	}
	
	// recSchoolUpdate
	public int recSchoolUpdate(RecSchool recSchool){
		return recSchoolDao.recSchoolUpdate(recSchool);
	}
	
	// recSchoolDelete
	public int recSchoolDelete(RecSchool recSchool){
		return recSchoolDao.recSchoolDelete(recSchool);
	}
	
	// recSchoolListByAjax(info+rec)
	public List<RecWithInfoSchool> infoSchoolListAtPlanUniteByAjax(List<RecWithInfoSchool> recWithInfoSchoolList){
		List<RecWithInfoSchool> recInfoSchoolList = new ArrayList<RecWithInfoSchool>();
		try {
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(infoSchoolService.readUrl());
			JSONObject json =  (JSONObject) jsonObject.get("dataSearch");
			JSONArray schoolInfoArray = (JSONArray) json.get("content");
			System.out.println("schoolInfoArray.size() RecSchoolService : " + schoolInfoArray.size());
			System.out.println("recWithInfoSchoolList.size() RecSchoolService : " + recWithInfoSchoolList.size());
			
			for(int j=0; j<recWithInfoSchoolList.size(); j++){
				RecWithInfoSchool recWithInfoSchool = new RecWithInfoSchool();
				recWithInfoSchool = recWithInfoSchoolList.get(j);
				String seqForCheck = recWithInfoSchool.getSeq();

				for(int i=0; i<schoolInfoArray.size(); i++){
					JSONObject schoolObject = (JSONObject) schoolInfoArray.get(i);
					String seq = (String) schoolObject.get("seq");
					
					if(seq.equals(seqForCheck)){
						System.out.println("if문 실행 "+ i + " 번");
						//JSON name으로 추출
						recWithInfoSchool.setSeq((String) schoolObject.get("seq"));
						recWithInfoSchool.setTotalCount((String) schoolObject.get("totalCount")); 
						recWithInfoSchool.setSchoolName((String) schoolObject.get("schoolName"));
						recWithInfoSchool.setSchoolGubun((String) schoolObject.get("schoolGubun"));
						recWithInfoSchool.setSchoolType((String) schoolObject.get("schoolType"));
						recWithInfoSchool.setEstType((String) schoolObject.get("estType"));
						recWithInfoSchool.setRegion((String) schoolObject.get("region"));
						recWithInfoSchool.setAdres((String) schoolObject.get("adres"));
						recWithInfoSchool.setCollegeinfourl((String) schoolObject.get("collegeinfourl"));
						recWithInfoSchool.setLink((String) schoolObject.get("link"));
						recInfoSchoolList.add(recWithInfoSchool);
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recInfoSchoolList;
	}
	
	// recSchoolListByAjax(rec)
	public List<RecWithInfoSchool> recSchoolListByAjax(PlanUnite planUnite) {
		// recSchoolList 셋팅(by planUnit.jobdicSeq)
		List<RecWithInfoSchool> recWithInfoSchoolList = recSchoolDao.recSchoolListByAjax(planUnite);
		return recWithInfoSchoolList;
	}
	
	// infoSchoolListForRecSchoolList
	public List<InfoSchool> recSchoolList(Map<String, Object> map){
		List<InfoSchool> infoSchoolList = null;
		try {
			InfoSchool infoSchool = null;
			infoSchoolList = new ArrayList<InfoSchool>();
			net.sf.json.JSONArray recSchoolListJson = null;
			// JSONParser 객체 생성
			JSONParser jsonParser = new JSONParser();
			//JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser.parse(infoSchoolService.readUrl());
//			System.out.println("readUrl_school : " + readUrl());
//			System.out.println("jsonObject InfoSchoolService : " + jsonObject);
			
			JSONObject json =  (JSONObject) jsonObject.get("dataSearch");
			//content의 배열을 추출
			JSONArray schoolInfoArray = (JSONArray) json.get("content");
//			System.out.println("schoolInfoArray InfoSchoolService : " + schoolInfoArray);
				//Object JSONObject로 바꾸기
			Object recSchoolList = map.get("recSchoolListWithRecSchoolCondition");
			recSchoolListJson = net.sf.json.JSONArray.fromObject(JSONSerializer.toJSON(recSchoolList));
			System.out.println("recSchoolListJson InfoSchoolService : " + recSchoolListJson);
			System.out.println("infoSchoolList InfoSchoolService : " + infoSchoolList);
				
			////infoSchool에 있는 seq뽑아서 schoolInfoArray에 있는 값과 비교한뒤 infoSchool에 나머지들과 등록
			// infoservice는 안바꾸고 infoSchoolList값들 리턴 받은 후에 그 결과값에 seq(추천)들어있는 recSchoolList와 비교해서 리스트에 넣기
			for(int i=0; i<schoolInfoArray.size(); i++){
				infoSchool = new InfoSchool();
				//배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
				JSONObject schoolObject = (JSONObject) schoolInfoArray.get(i);
				String seq = (String) schoolObject.get("seq");
				
				if(recSchoolListJson != null){
					
					for(int j=0; j<recSchoolListJson.size(); j++){
						net.sf.json.JSONObject infoSchoolListJson = (net.sf.json.JSONObject) recSchoolListJson.get(j);
						String seqForRec = (String) infoSchoolListJson.get("seq");
						
						if(seq.equals(seqForRec)){
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
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return infoSchoolList;
	}
	
	// 학교추천이유와 추천내용 가져오기
	public RecSchool recSchoolReason(RecSchool recSchool){
		return recSchoolDao.recSchoolReason(recSchool);
	}

	// 추천이유 및 상태 개수
	public int infoSchoolCountAtRec(Map<String, Object> map) {
		return recSchoolDao.infoSchoolCountAtRec(map);
	}

	// 추천이유 및 상태 리스트
	public List<RecSchool> recSchoolListWithRecSchoolCondition(Map<String, Object> map){
		return recSchoolDao.recSchoolListWithRecSchoolCondition(map);
	}

	public List<RecWithInfoSchool> recWithInfoSchoolList(
			List<RecSchool> recSchoolListWithRecSchoolCondition,
			List<InfoSchool> infoSchoolListForRec) {
		
		List<RecWithInfoSchool> recWithInfoSchoolList = new ArrayList<RecWithInfoSchool>();
		RecSchool recSchool = new RecSchool();
		InfoSchool infoSchool = new InfoSchool();
//		System.out.println("recSchoolListWithRecSchoolCondition.size() RecSchoolService : " + recSchoolListWithRecSchoolCondition.size());
//		System.out.println("infoSchoolListForRec.size() RecSchoolService :" + infoSchoolListForRec.size());
		
		for(int i=0; i<recSchoolListWithRecSchoolCondition.size(); i++){
			RecWithInfoSchool recWithInfoSchool = new RecWithInfoSchool();
			recSchool = recSchoolListWithRecSchoolCondition.get(i);
			recWithInfoSchool.setJobdicSeq(recSchool.getJobdicSeq());
			recWithInfoSchool.setRecSchoolCode(recSchool.getRecSchoolCode());
			recWithInfoSchool.setRecSchoolCondition(recSchool.getRecSchoolCondition());
			recWithInfoSchool.setRecSchoolContent(recSchool.getRecSchoolContent());
			recWithInfoSchool.setRecSchoolReason(recSchool.getRecSchoolReason());
			recWithInfoSchool.setRecSchoolRegisterDate(recSchool.getRecSchoolRegisterDate());
			recWithInfoSchool.setSeq(recSchool.getSeq());
			for(int j=0; j<infoSchoolListForRec.size(); j++){
				infoSchool = infoSchoolListForRec.get(j);
				if(recWithInfoSchool.getSeq().equals(infoSchool.getSeq())){
					recWithInfoSchool.setAdres(infoSchool.getAdres());
					recWithInfoSchool.setCollegeinfourl(infoSchool.getCollegeinfourl());
					recWithInfoSchool.setEstType(infoSchool.getEstType());
					recWithInfoSchool.setLink(infoSchool.getLink());
					recWithInfoSchool.setRegion(infoSchool.getRegion());
					recWithInfoSchool.setSchoolGubun(infoSchool.getSchoolGubun());
					recWithInfoSchool.setSchoolName(infoSchool.getSchoolName());
					recWithInfoSchool.setSchoolType(infoSchool.getSchoolName());
					recWithInfoSchool.setSchoolType(infoSchool.getSchoolType());
				}
			}
			recWithInfoSchoolList.add(recWithInfoSchool);
		}
		return recWithInfoSchoolList;
	}

}