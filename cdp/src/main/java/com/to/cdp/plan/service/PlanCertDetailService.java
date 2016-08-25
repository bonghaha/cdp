package com.to.cdp.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.to.cdp.plan.dao.PlanCertDetailDao;
import com.to.cdp.plan.model.PlanCertDetail;

@Service
public class PlanCertDetailService {
	@Autowired
	private PlanCertDetailDao planCertDetailDao;
	
	public int planCertDetailInsert(PlanCertDetail planCertDetail) {
		String planCertDetailLastKey = "";
		String planCertDetailCode = "";
		String planCertDetailPre = "plan_cert_detail_";
		// 마지막으로 생성된 plan_cert_detail_code 번호 select
		planCertDetailLastKey = planCertDetailDao.planCertDetailLastKey();
		
		int lastKeyNum = 0;
		if(planCertDetailLastKey == null){
			lastKeyNum = lastKeyNum+1;
		}else{
			// resume_cert_을 제외한 번호만 뽑아내서 +1 시킴
			lastKeyNum = Integer.parseInt(planCertDetailLastKey.substring(planCertDetailPre.length()))+1;
		}
		
		// resume_cert_번호 셋팅
		planCertDetailCode = planCertDetailPre + lastKeyNum;
		planCertDetail.setPlanCertDetailCode(planCertDetailCode);
		return planCertDetailDao.planCertDetailInsert(planCertDetail);
	}

	public List<PlanCertDetail> planCertDetailList(PlanCertDetail planCertDetail) {
		return planCertDetailDao.planCertDetailList(planCertDetail);
	}

	// 완료버튼 클릭시 condition 1로 바꾸기
	public int planCertDetailComplete(PlanCertDetail planCertDetail) {
		return planCertDetailDao.planCertDetailComplete(planCertDetail);
	}

	// planCertDetailCode에 해당하는 planCertCode받기
	public String pcCodeByPcdCode(PlanCertDetail planCertDetail) {
		return planCertDetailDao.pcCodeByPcdCode(planCertDetail);
	}
}
