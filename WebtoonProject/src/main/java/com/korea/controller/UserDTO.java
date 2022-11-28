package com.korea.controller;

public class UserDTO {
	   private String ID;    //아이디
	    private String PWD;    //비밀번호
	    private String EMAIL;    //이메일
	    
	    public String getID() {
	        return ID;
	    }
	    public void setID(String ID) {
	        this.ID = ID;
	    }
	    public String getPWD() {
	        return PWD;
	    }
	    public void setPWD(String PWD) {
	        this.PWD = PWD;
	    }
	    public String getEMAIL() {
	        return EMAIL;
	    }
	    public void setEMAIL(String EMAIL) {
	        this.EMAIL = EMAIL;
	    }
	    
	    @Override
	    public String toString() {
	        return "UserDTO [ID=" + ID + ", PWD=" + PWD + ", EMAIL=" + EMAIL + "]";
	    }
	    
	 
	}
