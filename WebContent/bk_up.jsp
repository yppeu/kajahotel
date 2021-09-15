<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>


		$(document).ready(function() {
	
			
			
			/*if('#roomtype option:selected'.val()=="bidam"){
				$('#price').text(130000);
			}else if('#roomtype option:selected'.val()=="chunhyang"){
				$('#price').text(350000);
			}else if('#roomtype option:selected'.val()=="ondal"){
				$('#price').text(130000);
			}*/
		});

		function rmChange(tVal) {
			if(tVal=="bidam"){
	 			$('#price').text(130000);
			}else if(tVal=="chunhyang"){
				$('#price').text(350000);
			}else if(tVal=='ondal'){
				$('#price').text(130000);
			}
			
		}

</script>
<style>

.bkup{
margin-top:100px;
margin-bottom:50px;
font-size: 25px;
padding-left:45%;

}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="bkup">예약 변경하기<br><br>
예약번호 : ${bk.BKNUM } 번</div> 




<form action="bkUpdate2.do" method="post">
<table border=1 align="center" style="margin-bottom:100px;">
	<tr>
		<td width="50%"  >
			<img src="${param.picture}" padding="20%">
		</td>
	
		<td  width="50%" align="center">
			<p>룸타입 : 
			<select id="roomtype" name="roomtype" onchange="rmChange(this.value)">
				<option value="bidam"<c:if test="${bk.RMTYPE eq 'bidam'}">selected</c:if>>비담</option>			
				<option value="chunhyang"<c:if test="${bk.RMTYPE eq 'chunhyang'}">selected</c:if>>춘향</option>
				<option value="ondal"<c:if test="${bk.RMTYPE eq 'ondal'}">selected</c:if>>온달</option>
			</select><br>
			<p>1박 요금:  <span id="price"> 0</span> KRW</p>
			<p>체크인날짜 선택<input type="date" name="checkindate" value="${bk.CHKIN }"></p><br>
			<p>체크아웃 날짜 선택<input type="date" name="checkoutdate" value="${bk.CHKOUT }"></p><br>
			<p >숙박인원 :
				<select name="headcount" >
					<option value="1"<c:if test="${bk.HEADCNT eq 1}">selected</c:if>>1</option>
					<option value="2"<c:if test="${bk.HEADCNT eq 2}">selected</c:if> >2</option>
					<option value="3"<c:if test="${bk.HEADCNT eq 3}">selected</c:if>>3</option>
					<option value="4"<c:if test="${bk.HEADCNT eq 4}">selected</c:if>>4</option>
					<option value="5"<c:if test="${bk.HEADCNT eq 5}">selected</c:if>>5</option>
				</select>
				
				명
			</p>
			<p>전화번호 입력: <input type="text" name="tel" value="${bk.TEL }"></p>
		<div>
		
			<input type="submit" value="예약 변경하기">
			
			<input type="reset" value="취소하기">
 		</div>
		</td>
	</tr>
	
	<input type="hidden" name="BKNUM" value="${bk.BKNUM }">
	
</table>
</form>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>