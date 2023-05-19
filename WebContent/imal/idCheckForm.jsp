<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>idCheckForm.jsp</title>
</head>
<body>
	<div style="text-align: center">
	<h3>* 아이디 중복확인 *</h3>
	
    <form method="post" action="<%=cp %>/itmall/idCheckPro.do" onsubmit="return blankCheck(this)">
    아이디 : <input type="text" name="id"  maxlength="20" autofocus>
    <input type="submit" value="중복확인">
    </form>
    </div>
    
    <script>
    
    function blankCheck(f){
    	var id=f.id.value;
        id=id.trim();
        if(id.length<5){
        	alert("아이디는 5자 이상 입력해주십시오.");
            return false;
        }
		if(id.length>20){
			alert("아이디는 20자 미만 입력해주십시오.")
		}
        return true;
    }//blankCheck() end
    
    </script>
 </body>
 </html>