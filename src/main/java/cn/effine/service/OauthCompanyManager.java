package cn.effine.service;

import java.util.List;

import cn.effine.model.OauthCompany;

public interface OauthCompanyManager {
    public OauthCompany getoCompany(String id);
	
	public List<OauthCompany> getAlloCompany();
	
	public void addoCompany(OauthCompany oauthCompany);
	
	
	public boolean deloCompany(String id);
	
	
	public boolean updateoCompany(String id);
	
	
	public boolean checkCid(String uid);
}
