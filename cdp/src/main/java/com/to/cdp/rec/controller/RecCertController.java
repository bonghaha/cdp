package com.to.cdp.rec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.rec.model.RecCert;
import com.to.cdp.rec.service.RecCertService;

@Controller
public class RecCertController {
	@Autowired
	private RecCertService recCertService;
	
	// 1. recCertInsert
	@RequestMapping(value="/recCertInsert", method=RequestMethod.GET)
	public String recCertInsert(){
		return "recCertInsert";
	}
	
	@RequestMapping(value="/recCertInsert", method=RequestMethod.POST)
	public String recCertInsert(RecCert recCert){
		return "recCertDetail";
	}
	
	// 2. recCertUpdate
	@RequestMapping(value="/recCertUpdate", method=RequestMethod.GET)
	public String recCertUpdate(){
		return "recCertUpdate";
	}
	
	@RequestMapping(value="/recCertUpdate", method=RequestMethod.POST)
	public String recCertUpdate(RecCert recCert){
		return "recCertDetail";
	}
	
	// 3. recCertDelete
	@RequestMapping(value="/recCertDelete", method=RequestMethod.GET)
	public String recCertDelete(){
		return "recCertDelete";
	}
	
	@RequestMapping(value="/recCertDelete", method=RequestMethod.POST)
	public String recCertDelete(RecCert recCert){
		return "redirect:/recCertList";
	}
	
	// 4. recCertList
	@RequestMapping(value="/recCertList", method=RequestMethod.GET)
	public String recCertList(){
		return "recCertList";
	}
	
	@RequestMapping(value="/recCertList", method=RequestMethod.POST)
	public String recCertList(RecCert recCert){
		return "recCertList";
	}
	
	// 5. recCertDetail
	@RequestMapping(value="/recCertDetail", method=RequestMethod.GET)
	public String recCertDetail(){
		return "recCertDetail";
	}
	
	@RequestMapping(value="/recCertDetail", method=RequestMethod.POST)
	public String recCertDetail(RecCert recCert){
		return "recCertDetail";
	}
}