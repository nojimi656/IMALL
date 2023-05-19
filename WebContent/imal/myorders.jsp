<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.tb1{
	border-bottom: 2px solid #E4E4E4;
	border-right: 2px solid #E4E4E4;
	border-left: 2px solid #E4E4E4;
}
.tb2{
	border-bottom: 2px solid #E4E4E4;
	border-right: 2px solid #E4E4E4;
}

</style>
</head>
<body>

<table style="margin: auto;" width="800">
<tr><td align="left"><a href="<%=cp %>/itmall/main.do">
<img alt="로고" src="<%=cp %>/imal/data/logo/imal_logo.png" align="left"/></a>
</td></tr>
</table>

<hr>
<br/>

<table style="margin: auto;" width="800">
	<tr>
		<td align="left"><font size="6">주문 목록</font></td>
	</tr>	
	<tr><td bgcolor="#0079EB" height="2"></td></tr>
</table>

<br/><br/>

<table style="margin: auto;" width="800" cellpadding="0" cellspacing="0" border="0">
	<tr>	
		<td colspan="3" align="left"><font size="5">주문 정보</font></td>
	</tr>	
	<tr><td colspan="3" bgcolor="gray" height="2"></td></tr>
	<tr bgcolor="#F4F4F4">
		<td align="center" style="border-bottom: 2px solid gray;">상품 이름</td>
		<td align="center" style="border-bottom: 2px solid gray;">도착 예정/완료일</td>
		<td align="center" style="border-bottom: 2px solid gray;">주문 요청사항</td>
	</tr>
	<c:forEach var="dto" items="${lists }">
	<tr>
		<td bgcolor="#F4F4F4" width="auto" align="center" height="30" class="tb1"><b>${dto.title }</b></td>
		<td align="center" class="tb2">${dto.days }</td>
		<td align="center" style="border-bottom:2px solid #E4E4E4;">${dto.ordeq }</td>
	</tr>
	</c:forEach>
</table>










</body>
</html>