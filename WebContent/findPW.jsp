<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<br><br><br><br>

<table align = "center">
		<tr>
			<th colspan="3"><h2>비밀번호 찾기</h2></th>
		<tr>
		<tr>
			<td colspan="3"><p>비밀번호가 기억나지 않으시나요?<br>아이디(이메일)와 비밀번호 확인 질문으로 비밀번호를 찾을 수 있습니다.<p></td>	
		<tr>
		<tr>
			<td colspan="3"><p>아이디(이메일) 입력<p></td>
		<tr>
		<tr>
			<td colspan="3"><input type="text" name="findPWemail" placeholder="이메일 입력" required></td>
		<tr>
		<tr>
			<td colspan="3"><p>비밀번호 확인 질문<p></td>
		<tr>
		<tr>
			<td colspan="3"><select id="hint" name="hint" fw-filter="" fw-label="hint" fw-msg="">
									<option value="hint_01">기억에 남는 추억의 장소는?</option>
									<option value="hint_02">자신의 인생 좌우명은?</option>
									<option value="hint_03">자신의 보물 제1호는?</option>
									<option value="hint_04">가장 기억에 남는 선생님 성함은?</option>
									<option value="hint_05">타인이 모르는 자신만의 신체비밀이 있다면?</option>
									<option value="hint_06">추억하고 싶은 날짜가 있다면?</option>
									<option value="hint_07">받았던 선물 중 기억에 남는 독특한 선물은?</option>
									<option value="hint_08">유년시절 가장 생각나는 친구 이름은?</option>
									<option value="hint_09">인상 깊게 읽은 책 이름은?</option>
									<option value="hint_10">읽은 책 중에서 좋아하는 구절이 있다면?</option>
									<option value="hint_11">자신이 두번째로 존경하는 인물은?</option>
									<option value="hint_12">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
									<option value="hint_13">초등학교 때 기억에 남는 짝꿍 이름은?</option>
									<option value="hint_14">다시 태어나면 되고 싶은 것은?</option>
									<option value="hint_15">내가 좋아하는 캐릭터는?</option>
			</select></td>
		<tr>
		<tr>
			<td colspan="2"><input type="text" name="findPWqna" placeholder="비밀번호 확인 질문 답변" required></td>
			<td><input type="submit" value="찾기">
		<tr>
	
	
	</table>
<br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>