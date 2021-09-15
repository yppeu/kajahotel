<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>kjbrand</title>
<link rel="stylesheet" href="kjbrand.css">

<style type="text/css">
.information{

margin-top: 150px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
	<div class="information" align="center" >
		<img src="pictures/hotel.jpg" alt="호텔사진" />
		
		<h2>Kaja Brand</h2>
		
		<p>가자호텔은 가자브랜드에서 선보이는 럭셔리 호텔로 서울 종로에 위치하고 있습니다. 가자호텔은 고객의 다양한 요구에 부합되는 <br />
		최고의 서비스와 시설로 고객 여러분의 편한한 휴식과 만족을 제공하기 위해 모든 임직원이 다함께 노력할 것을 약속 드립니다. <br />
		항상 한발 앞서가는 고객 만족의 서비스를 실천하여, 고객 여러분의 최고의 선택이 되게하겠습니다. 고객 여러분의 끊임없는 격려와 <br />
		관심으로 성원해 주시길 부탁드리겠습니다.
		</p>
	</div>
	
	<hr />
	
	<div class="container2" align="center">
	
		<div class="ondalroom">
			<img src="pictures/ondal.jpg" width="50%" >
			<h3><온달룸></h3>
		</div>
		
		<div class="bidamroom">
			<img src="pictures/bidam.jpg" width="50%">
				<h3><비담룸></h3>
		</div>
		
		<div class="chunhyangroom">
			<img src="pictures/chunhyang.jpg" width="50%">
				<h3><춘향룸></h3>
		</div>
	</div>
	
</div>

	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>