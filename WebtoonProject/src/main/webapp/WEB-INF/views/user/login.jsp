<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
loginFrom.jsp

<h1> �α��� </h1>

<fieldset>
  <legend> ITWILL �α��� </legend>
  <!-- <form action="/member/login" method="post"> -->
  <form action="" method="post">
    ID : <input type="text" name="ID"> <br>
    PW : <input type="password" name="PWD"> <br>
    <input type="submit" value="�α���">          
    <input type="button" onclick="location.href='/user/joinform'" value="ȸ������">  
            
  </form>  
</fieldset>