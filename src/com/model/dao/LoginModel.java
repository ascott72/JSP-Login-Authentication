package com.model.dao;

public class LoginModel {
	
	private int userID;
	private String username;
	private String email;
	private String psword;
	
	public int getUserID(){
		return userID;
	}
	
	public void setUserID(int userID){
		this.userID=userID;
	}
	
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username=username;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email=email;
	}
	public String getPsword(){
		return psword;
	}
	public void setPsword(String psword){
		this.psword=psword;
	}
}
