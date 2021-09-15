<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KAJA 호텔에 오신걸 환영합니다.</title>
<link rel="stylesheet" href="join.css">
<jsp:include page="header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

$(document).ready(function () {
	$('select[name=emailSelection]').change(function () {
		if($(this).val()=="1"){
			$('#email2').attr("readonly",false);
			$('#email2').val("");
		}else {
			$('#email2').val($(this).val());
			$('#email2').attr("readonly",true);
		}
	});
});
</script>
</head>
<body>
	<div id="contents">

		<div>
			<h1>회원가입</h1>
		</div>

		<div id="contents2">
			<div>
				<form action="join.do" method="post">
					<table border="1" summary="">
						
						<tbody>
							<tr class="displaynone">
								<th scope="row">성함</th>
								<td><input id="lastname" name="lastname" maxlength="3" value="성" type="text" onfocus="this.value=''"> 
								<input id="firstname" name="firstname" maxlength="5" value="이름" type="text" onfocus="this.value=''"></td>
							</tr>

							<tr class="mobile">
								<th scope="row">휴대전화</th>
								<td><input id="mobile2" maxlength="11" value="전화번호(11)" type="text" onfocus="this.value=''"></td>
							</tr>

							<tr class="email">
								<th>이메일</th>
								<td><input id="email1" name="email1" value="이메일" type="text" onfocus="this.value=''">@
								<input id="email2" name="email2" value="직접입력" type="text">
								<select id="emailSelection" name="emailSelection" >
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="google.com">google.com</option>
										<option value="1">직접입력</option>
										
								</select>
								</td>
							</tr>

							<tr>
								<th scope="row">비밀번호</th>
								<td>
									<div class="eTooltip">
										<input id="passwd" name="passwd" maxlength="16" value="비밀번호" type="password" onfocus="this.value=''">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호 확인</th>
								<td><input id="user_passwd_confirm"
									name="user_passwd_confirm" maxlength="16" 0="disabled" value="비밀번호확인" type="password" onfocus="this.value=''"> 
							</tr>
							
						</tbody>
					</table>
					
					<tr>
					 <td><input type='checkbox' name="" value="" />
							개인 정보 수집 및 이용 동의(필수)</td><br />  
					</tr>
					
					<tr class="submit">
						<td><input type="submit" method="post" value="가입" /></td>
						<td><input type="reset" method="post" value="취소" /></td>
					</tr>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
</html>