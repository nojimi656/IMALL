<%@page import="com.bag.bagDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.bag.bagDAO"%>
<%@page import="com.util.PJConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
// 	Connection conn = PJConn.getConnection();
// 	bagDAO dao = new bagDAO(conn);
	
// 	int bagCount = dao.bagCount("suzi");
	
// 	List<bagDTO> lists = dao.allBagData("suzi");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	//금액 불러오기
	function calc(no){
		var price = document.getElementById("gulPrice" + no).value;
		price = parseInt(price);
		return price;
	}
	
	//전체 선택/해체
	function all_del(){
		var total_price = 0;
		var num = 0;
		var obj = document.getElementsByName("check");
		
		if(obj[0].checked){
			for(i=0; i<obj.length; i++){
				obj[i].checked = false;
			}
			
		}else{
			for(i=0; i<obj.length; i++){
				obj[i].checked = true;
				num++;
				total_price+= calc(i);
			}
		}
		
		$("#totalGoodsPrice").html(total_price);
		$("#totalGoodsCnt").html(num);
		
	}
	
	//하나의 체크박스 선택
	function selItem() {
    var total_price = 0;
    var price = 0;
    var num = 0;
 
    var obj = document.getElementsByName("check");
    for (i=0;i<obj.length;i++) {
        if (obj[i].checked) {
            price = calc(i);
            total_price = total_price + price;
            num++;
        }
    }
 
    $("#totalGoodsPrice").html(total_price);
    $("#totalGoodsCnt").html(num);
}
	
	// 구매하기
	function buying() {
	    var boo = false;
	    var obj = document.getElementsByName("check");
	    for (i=0;i<obj.length;i++) {
	        if (obj[i].checked) {
	            boo = true;
	            break;
	        }
	    }
	 
	    if (boo==false) {
	        alert("구매하실 항목을 적어도 하나이상 선택해 주십시오.");
	        return;
	    }
	 
	    var f = document.myForm;
	    f.action = "payment.do";
	    f.submit();    
	}

	//선택상품 삭제
	function delItem() {
    var boo = false;
    var obj = document.getElementsByName("check");
    for (i=0;i<obj.length;i++) {
        if (obj[i].checked) {
            boo = true;
            break;
        }
    }
 
    if (boo==false) {
        alert("삭제하실 항목을 적어도 하나이상 선택해 주십시오.");
        return;
    }
 
    var form = document.myForm;
    form.action = "bag_del.do";
    form.submit();
}

	//더담기로 메인 페이지 이동
	function goMain(){
		
		var f = document.myForm;
		
		f.action = "main.do";
		f.submit();
	}
	
</script>

</head>
<body>

<form action="" name="myForm" method="post">
 <p align="center"><font size='7'>장바구니</font></p>
  <table width="560" border="0" cellpadding="0" cellspacing="0" style="margin: auto;" bgcolor="#dbdbdb" >
    <tr><td colspan="3" height="3" bgcolor="black" align="center"></td></tr>
    <tr height="20">
    	<td align="center">상품정보</td>
      	<td align="center">상품금액</td>
      	<td align="center">배송비</td>
    </tr>
 <tr><td colspan="3" height="3" bgcolor="black" align="center"></td></tr>
 <c:if test="${bagCount==0 }">
 <tr height="500"><td colspan="3" align="center">장바구니에 담긴물건이 없습니다</td></tr>
</c:if>
</table>

<c:if test="${bagCount!=0 }">
<c:set var="num" value="0"/>
<table width="560" border="0" cellpadding="0" cellspacing="0" style="margin: auto;">
	<c:forEach var="dto" items="${lists }">
	<tr>
		<td><input type="checkbox" name="check" value="${dto.goods_num }" onclick="selItem();">
			<input type="hidden" id="gulPrice${num }" name="gulPrice${num }" value="${dto.price }">
		</td>
		<td width="100"><img src="<%=cp %>/testimage/${dto.saveFileName }" style="height: 100px; width: 100px;"></td>
		<td align="center">${dto.title }</td>
		<td align="center">${dto.price }</td>
		<td align="center">무료</td>
	</tr>	
	<tr><td colspan="5" height="2" bgcolor="black" align="center"></td></tr>
	<c:set var="num" value="${num+1 }"/>
	</c:forEach>
</table>
</c:if>
		
<br/><br/>

<p align="center"><input type="button" value="전체선택 / 전체해제" onclick="all_del();">



<table style="margin: auto;" border="1" cellpadding="0" cellspacing="0" width="80%">
<tr><td align="center" bgcolor="#dbdbdb">
<div>
	<dl>
		<dt>총<strong id="totalGoodsCnt">0</strong>선택항목</dt>
		<dd style="color: red;"><strong id="totalGoodsPrice">0</strong>원</dd>
	</dl>
</div>
</td></tr>		
</table>

<br/><br/>	

<table width="400" border="0" cellpadding="0" cellspacing="0" style="margin: auto;">
	<tr>
		<td><input type="button" value="더 담기" style="width: 200px; height: 100px;" onclick="goMain();"></td>
		<td><input type="button" value="선택상품 삭제" style="width: 200px; height: 100px;" onclick="delItem();"></td>
		<td><input type="button" value="선택상품 결제" style="width: 200px; height: 100px;" onclick="buying();"></td>
</table>		


</form>
</body>
</html>