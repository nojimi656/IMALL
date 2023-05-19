<%@page import="java.util.Calendar"%>
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
	padding-right: 10px;
}

.tb2{
	border-bottom: 2px solid #E4E4E4;
	border-left: 2px solid #E4E4E4;
	padding-left: 10px;
}

.tb3{
	border-top: 2px solid #E4E4E4;
	border-left: 2px solid #E4E4E4;
	border-right: 2px solid #E4E4E4;
}

.tb4{
	padding-left: 10px;
	border-bottom: 2px solid #E4E4E4;
	border-left: 2px solid #E4E4E4;
	border-right: 2px solid #E4E4E4;
}

.bt{
	height: 100px;
	width: 200px;
	background-color: #0079EB;
	color: #ffffff;
	font-size: 35px;
	border: #0079EB;
	font-family: '맑은 고딕';
}
</style>
<script type="text/javascript">

	function goPay(){
		
		var f = document.myForm;
		
		if(!confirm("결제하시겠습니까?")){
			
			f.action = "list.do";
			f.submit();
			
		}else{
			
			f.action = "payfinish.do";
			f.submit();
		}
	}


</script>


</head>
<body>

<table>
<h1 align="center">
<img src="<%=cp %>/imal/data/logo/imal_logo.png" alt="itwillmall"/>
</h1>
</table>

<hr>
<br/>
<form action="" name="myForm">
<table style="margin: auto;" width="800">
	<tr>
		<td align="left"><font size="6">주문/결제</font></td>
		<td align="right" style="color: #dbdbdb;">장바구니&gt;<font color="blue">주문결제 &gt;</font>
		주문완료</td>
	</tr>	
	<tr><td colspan="2" bgcolor="black" height="2">
</table>

<br/>

<table style="margin: auto;" width="800" cellpadding="0" cellspacing="0" border="0">
	<tr>	
		<td colspan="2" align="left"><font size="5">구매자정보</font></td>
	</tr>	
	<tr><td colspan="2" bgcolor="gray" height="2"></td></tr>
	
	<tr>
		<td bgcolor="#F4F4F4" width="20%" align="right" class="tb1" height="30"><b>이름</b></td>
		<td align="left" class="tb2">${lgdto.userName }</td>
	</tr>
		
	<tr>
		<td bgcolor="#F4F4F4" width="20%" align="right" class="tb1" height="30"><b>아이디</b></td>
		<td align="left" class="tb2">${lgdto.userId }</td>
	</tr>
	
	<tr>
		<td bgcolor="#F4F4F4" width="20%" align="right" class="tb1" height="50"><b>휴대폰 번호</b></td>	
		<td align="left" class="tb2">${lgdto.userTel }</td>
	</tr>	
</table>

<br/>

<table style="margin: auto;" width="800" cellpadding="0" cellspacing="0" border="0">
	<tr>	
		<td colspan="2" align="left"><font size="5">받는사람정보</font></td>
	</tr>	
	<tr><td colspan="2" bgcolor="gray" height="2"></td></tr>
	
	<tr>
		<td bgcolor="#F4F4F4" width="20%" align="right" class="tb1" height="30"><b>이름</b></td>
		<td align="left" class="tb2">${lgdto.userName }</td>
	</tr>
		
	<tr>
		<td bgcolor="#F4F4F4" width="20%" align="right" class="tb1" height="30"><b>배송주소</b></td>
		<td align="left" class="tb2">${lgdto.userAddr }</td>
	</tr>
	
	<tr>
		<td bgcolor="#F4F4F4" width="20%" align="right" class="tb1" height="50"><b>연락처</b></td>	
		<td align="left" class="tb2">${lgdto.userTel }</td>
	</tr>	
	
	<tr>
		<td bgcolor="#F4F4F4" width="20%" align="right" class="tb1" height="50"><b>배송 요청사항</b></td>	
		<td align="left" class="tb2">
		<select name="ordeq">
			<option value="문 앞">문 앞</option>
			<option value="직접 받고 부재 시 문 앞">직접 받고 부재 시 문 앞</option>
			<option value="경비실">경비실</option>
			<option value="택배함">택배함</option>
		</select>
		</td>
	</tr>	
</table>

<br/>

<table style="margin: auto;" cellpadding="0" cellspacing="0" width="800">
	<tr><td align="left"><font size="5">배송 상품</font></td></tr>
	<tr height="50"><td bgcolor="#F4F4F4" style="padding-left: 10px;" class="tb3"><font color="green">
	<b>${month }/${day }</b> 도착 예정</font></td></tr>
	<c:forEach var="dto" items="${lists }">
	
	<tr height="35"><td class="tb4">${dto.title }</td></tr>
	<input type="hidden" name="goods_num" value="${dto.goods_num }">
	
	</c:forEach>
</table>

<br/>

<table style="margin: auto;" width="800" cellpadding="0" cellspacing="0" border="0">
	<tr>	
		<td colspan="2" align="left"><font size="5">결제정보</font></td>
	</tr>	
	<tr><td colspan="2" bgcolor="gray" height="2"></td></tr>
	
	<tr>
		<td bgcolor="#F4F4F4" width="20%" align="right" class="tb1" height="30"><b>총상품가격</b></td>
		<td align="left" class="tb2">${totalPrice }</td>
	</tr>
		
	<tr>
		<td bgcolor="#F4F4F4" width="20%" align="right" class="tb1" height="30"><b>결제방법</b></td>
		<td align="left" class="tb2">카드결제</td>
	</tr>
</table>

<br/><br/>

<p align="center"/><input type="button" class="bt" value="결제하기" onclick="goPay();"/>
<input type="hidden" name="userId" value="${lgdto.userId }">
<input type="hidden" name="month" value="${month }">
<input type="hidden" name="day" value="${day }">

</form>



</body>
</html>