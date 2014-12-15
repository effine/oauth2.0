package com.tgb.manager;

import java.util.List;

import com.tgb.entity.User;
import com.tgb.entity.OauthCompany;

public interface OauthCompanyManager {
    public OauthCompany getoCompany(String id);
	
	public List<OauthCompany> getAlloCompany();
	
	public void addoCompany(OauthCompany oauthCompany);
	
	
	public boolean deloCompany(String id);
	
	
	public boolean updateoCompany(String id);
	
	
	public boolean checkCid(String uid);
}
