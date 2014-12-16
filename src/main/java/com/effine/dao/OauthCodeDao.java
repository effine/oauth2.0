package main.java.com.effine.dao;

import java.util.List;

import main.java.com.effine.model.OauthCode;


public interface OauthCodeDao {
	
	public OauthCode getoCode(String id);
	
	public List<OauthCode> getAlloCode();
	
	public void addoCode(OauthCode oauthCode);
	
	
	public boolean deloCode(String id);
	
	
	public boolean updateoCode(String id);
	
	
	public boolean checkCid(String uid);
}
