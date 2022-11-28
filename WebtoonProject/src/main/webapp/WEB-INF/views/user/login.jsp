<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
loginFrom.jsp

<h1> 로그인 </h1>

<fieldset>
  <legend> ITWILL 로그인 </legend>
  <!-- <form action="/member/login" method="post"> -->
  <form action="" method="post">
    ID : <input type="text" name="ID"> <br>
    PW : <input type="password" name="PWD"> <br>
    <input type="submit" value="로그인">          
    <input type="button" onclick="location.href='/user/joinform'" value="회원가입">  
            
  </form>  
</fieldset>