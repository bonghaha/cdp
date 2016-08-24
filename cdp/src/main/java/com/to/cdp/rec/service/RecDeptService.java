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

import com.to.cdp.info.model.InfoDept;
import com.to.cdp.info.service.InfoDeptService;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.rec.dao.RecDeptDao;
import com.to.cdp.rec.model.RecDept;
import com.to.cdp.rec.model.RecSchool;
import com.to.cdp.rec.model.RecWithInfoDept;
import com.to.cdp.rec.model.RecWithInfoSchool;

import net.sf.json.JSONSerializer;

@Service
@Transactional
public class RecDeptService {
	
	@Autowired
	private RecDeptDao recDeptDao;
	@Autowired
	private InfoDeptService infoDeptService;
	
	// recDeptInsert
	public int recDeptInsert(RecDept recDept) {
		String recDeptLastKey = "";
		String recDeptCode = "";
		String recDeptPre = "rec_dept_";
		// 마지막으로 생성된 resume_dept_code 번호 select
		recDeptLastKey = recDeptDao.recDeptLastKey();
		
		int lastKeyNum = 0;
		if(recDeptLastKey == null){
			lastKeyNum = lastKeyNum+1;
		}else{
			// resume_dept_를 제외한 번호만 뽑아내서 +1 시킴
			lastKeyNum = Integer.parseInt(recDeptLastKey.substring(recDeptPre.length()))+1;
		}
		
		// resume_dept_번호 셋팅
		recDeptCode = recDeptPre + lastKeyNum;
		recDept.setRecDeptCode(recDeptCode);
		return recDeptDao.recDeptInsert(recDept);
	}
	
	// recDeptUpdate
	public int recDeptUpdate(RecDept recDept){
		return recDeptDao.recDeptUpdate(recDept);
	}
	
	// recDeptDelete
	public int recDeptDelete(RecDept recDept){
		return recDeptDao.recDeptDelete(recDept);
	}
	
	// recDeptList
	public List<InfoDept> recDeptList(Map<String, Object> map){
		List<InfoDept> infoDeptList = null;
			
		try {
			InfoDept infoDept = null;
			infoDeptList = new ArrayList<InfoDept>();
			net.sf.json.JSONArray recDeptListJson = null;
			// JSONParser 객체 생성
			JSONParser jsonParser = new JSONParser();
			//JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser.parse(infoDeptService.readUrl());
//						System.out.println("jsonObject InfojobService : " + jsonObject);
			
			JSONObject json = (JSONObject) jsonObject.get("dataSearch");
			//item의 배열을 추출
			JSONArray deptInfoArray = (JSONArray) json.get("content");
			
			Object recDeptList = map.get("recDeptListWithRecDeptCondition");
			recDeptListJson = net.sf.json.JSONArray.fromObject(JSONSerializer.toJSON(recDeptList));
			System.out.println("recDeptListJson infoDeptService : " + recDeptListJson);
			System.out.println("recDeptList infoDeptService : " + recDeptList);
			
			for(int i=0; i<deptInfoArray.size(); i++){
				infoDept = new InfoDept();
				//배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
				JSONObject deptObject = (JSONObject) deptInfoArray.get(i);
				String majorSeq = (String) deptObject.get("majorSeq");
				if(recDeptList != null){
					for(int j=0; j<recDeptListJson.size(); j++){
						net.sf.json.JSONObject infoDeptListJson = (net.sf.json.JSONObject) recDeptListJson.get(j);
						String majorSeqForRec = (String) infoDeptListJson.get("majorSeq");
						if(majorSeq.equals(majorSeqForRec)){
							//JSON name으로 추출
							infoDept.setTotalCount((String) deptObject.get("totalCount")); 
							infoDept.setMajorSeq((String) deptObject.get("majorSeq"));
							infoDept.setlClass((String) deptObject.get("lClass"));
							infoDept.setmClass((String) deptObject.get("mClass"));
							infoDept.setFacilName((String) deptObject.get("facilName"));
							infoDeptList.add(infoDept);
						}
					}
				}			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return infoDeptList;
	}
	
	// recDeptDetail
	public RecDept recDeptDetail(RecDept recDept){
		return recDeptDao.recDeptDetail(recDept);
	}

	public int infoDeptCountAtRec(Map<String, Object> map) {
		return recDeptDao.infoDeptCountAtRec(map);
	}

	public List<RecDept> recDeptListWithRecDeptCondition(Map<String, Object> map) {
		return recDeptDao.recDeptListWithRecDeptCondition(map);
	}

	public List<RecWithInfoDept> recWithInfoDeptList(
			List<RecDept> recDeptListWithRecDeptCondition,
			List<InfoDept> infoDeptListForRec) {
		
		List<com.to.cdp.rec.model.RecWithInfoDept> recWithInfoDeptList = new ArrayList<RecWithInfoDept>();
		RecDept recDept = new RecDept();
		InfoDept infoDept = new InfoDept();
		
		for(int i=0; i<recDeptListWithRecDeptCondition.size(); i++) {
			com.to.cdp.rec.model.RecWithInfoDept recWithInfoDept = new RecWithInfoDept();
			recDept = recDeptListWithRecDeptCondition.get(i);
			recWithInfoDept.setJobdicSeq(recDept.getJobdicSeq());
			recWithInfoDept.setMajorSeq(recDept.getMajorSeq());
			recWithInfoDept.setRecDeptCode(recDept.getRecDeptCode());
			recWithInfoDept.setRecDeptReason(recDept.getRecDeptReason());
			recWithInfoDept.setRecDeptContent(recDept.getRecDeptContent());
			recWithInfoDept.setRecDeptCondition(recDept.getRecDeptCondition());
			recWithInfoDept.setRecDeptRegisterDate(recDept.getRecDeptRegisterDate());
			for(int j=0; j<infoDeptListForRec.size(); j++) {
				infoDept = infoDeptListForRec.get(j);
				if(recWithInfoDept.getMajorSeq().equals(infoDept.getMajorSeq())) {
					recWithInfoDept.setlClass(infoDept.getlClass());
					recWithInfoDept.setmClass(infoDept.getmClass());
					recWithInfoDept.setFacilName(infoDept.getFacilName());
				}
			}
			recWithInfoDeptList.add(recWithInfoDept);
		}
		return recWithInfoDeptList;
	}

	// recDeptListByAjax(rec)
	public List<RecWithInfoDept> recDeptListByAjax(PlanUnite planUnite) {
		// recDeptList 셋팅(by planUnit.jobdicSeq)
			List<RecWithInfoDept> recWithInfoDeptList = recDeptDao.recDeptListByAjax(planUnite);
			return recWithInfoDeptList;
	}

	// recDeptListByAjax(info+rec)
	public List<RecWithInfoDept> infoDeptListAtPlanUniteByAjax(List<RecWithInfoDept> recWithInfoDeptList){
		List<RecWithInfoDept> recInfoDeptList = new ArrayList<RecWithInfoDept>();
		try {
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(infoDeptService.readUrl());
			JSONObject json =  (JSONObject) jsonObject.get("dataSearch");
			JSONArray deptInfoArray = (JSONArray) json.get("content");
			System.out.println("deptInfoArray.size() RecDeptService : " + deptInfoArray.size());
			System.out.println("recWithInfoDeptList.size() RecDeptService : " + recWithInfoDeptList.size());
			
			for(int j=0; j<recWithInfoDeptList.size(); j++){
				RecWithInfoDept recWithInfoDept = new RecWithInfoDept();
				recWithInfoDept = recWithInfoDeptList.get(j);
				String majorSeqForCheck = recWithInfoDept.getMajorSeq();

				for(int i=0; i<deptInfoArray.size(); i++){
					JSONObject deptObject = (JSONObject) deptInfoArray.get(i);
					String majorSeq = (String) deptObject.get("majorSeq");
					
					if(majorSeq.equals(majorSeqForCheck)){
						System.out.println("if문 실행 "+ i + " 번");
						//JSON name으로 추출
						recWithInfoDept.setMajorSeq((String) deptObject.get("majorSeq"));
						recWithInfoDept.setTotalCount((String) deptObject.get("totalCount")); 
						recWithInfoDept.setlClass((String) deptObject.get("lClass"));
						recWithInfoDept.setmClass((String) deptObject.get("mClass"));
						recWithInfoDept.setFacilName((String) deptObject.get("facilName"));
						recInfoDeptList.add(recWithInfoDept);
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recInfoDeptList;
	}

	// 추천학과이유,내용 가져오기
	public RecDept recDeptReason(RecDept recDept) {
		return recDeptDao.recDeptReason(recDept);
	}
}