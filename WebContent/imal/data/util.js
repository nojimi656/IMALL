// 내용의 값의 빈공백을 trim(앞/뒤)
String.prototype.trim = function() {
		var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
		return this.replace(TRIM_PATTERN, "");
};

// E-Mail 검사
function isValidEmail(email) {
	var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
    if (email.search(format) != -1)
        return true; //올바른 포맷 형식
    return false;
}

// 한글 필터링
function isValidKorean(data){
     // UTF-8 코드 중 AC00부터 D7A3 값이지 검사
	var format = /^[\uac00-\ud7a3]*$/g;
    if (data.search(format) != -1)
        return true; //올바른 포맷 형식
    return false;
}

// 날짜 검사
function isValidDate(year, month, day) {
	var days = new Array (31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

     if(year%4==0 && year%100 !=0 || year%400==0)
       days[1]=29;
     else
       days[1]=28;

     if(month < 1 || month > 12)
       return false;

     if(day > days[month-1] || day < 1)
       return false;
     return true;
}



//회원가입

//체크박스 전체 선택
$(".checkbox_group").on("click", "#check_all", function () {
$(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
});

//체크박스 개별 선택
$(".checkbox_group").on("click", ".normal", function() {
var is_checked = true;

$(".checkbox_group .normal").each(function(){
   is_checked = is_checked && $(this).is(":checked");
});

$("#check_all").prop("checked", is_checked);
});


//birth
$(document).ready(function(){            
var now = new Date();
var year = now.getFullYear();
var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
//년도 selectbox만들기               
for(var i = 1900 ; i <= year ; i++) {
   $('#year').append('<option value="' + i + '">' + i + '</option>');    
}

// 월별 selectbox 만들기            
for(var i=1; i <= 12; i++) {
   var mm = i > 9 ? i : "0"+i ;            
   $('#month').append('<option value="' + mm + '">' + mm + '</option>');    
}

// 일별 selectbox 만들기
for(var i=1; i <= 31; i++) {
   var dd = i > 9 ? i : "0"+i ;            
   $('#day').append('<option value="' + dd + '">' + dd+ '</option>');    
}
$("#year  > option[value="+year+"]").attr("selected", "true");        
$("#month  > option[value="+mon+"]").attr("selected", "true");    
$("#day  > option[value="+day+"]").attr("selected", "true");       

})



