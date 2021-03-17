<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카오스 SNS</title>
<style>
.col-sm-4 {
	margin: auto;
	min-width: 400px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">


<script type="text/javascript">
	// 메일로 받은 인증번호 키
	var authKey;
	var email;
	$(function() {
		//idck 버튼을 클릭했을 때 
		$('#sendE')
				.click(
						function() {
							//userid 를 param.
							email = $('#email').val();
							$
									.ajax({
										async : true,
										type : 'POST',
										data : email,
										url : "findId",
										dataType : "json",
										contentType : "application/json; charset=UTF-8",
										success : function(data) {
											if (data.info == null) {
												$("#chkID")
														.html(
																"<font color=Red>존재하는 정보가 없습니다.</font>")
														.css('border',
																'1px solid Gray')
											} else {
												$("#chkID")
														.html(
																"<font color=Blue>이메일이 발송되었습니다.</font>")
														.css('border',
																'1px solid Gray')
																sendEm();
											}
										},
										error : function(error) {
											alert("정보를 다시 입력해주세요.")
										}
									});
						});
	});
		function sendEm(){
							$
									.ajax({
										async : true,
										type : 'POST',
										data : email,
										url : "findIdsend",
										dataType : "json",
										contentType : "application/json; charset=UTF-8",
										success : function(data) {
											if(data.authKey!=null){
											 authKey=data.authKey;
											 alert(authKey);
											}
										},
										error : function(error) {
											alert("정보를 다시 입력해주세요.")
										}
									});			
		}
						
	
	$(function() {
		$('#Find_Id')
				.click(
						function() {							
							var key = $('#IauthKey').val();
							$
									.ajax({
										async : true,
										type : 'POST',
										data : email,
										url : "findId2",
										dataType : "json",
										contentType : "application/json; charset=UTF-8",
										success : function(data) {
											if (key = authKey) {
											if(data.length>0){
												$("#chkID").empty();
												$.each(data, function(index, item){
												$("#chkID")
														.append(
																"<font color=Blue>Id : "+item.id+"</font><br>")
														.css('border',
																'1px solid Gray')
											});												
												}
											}else {
												$("#chkID")
												.html(
														"<font color=Blue>인증번호가 일치하지 않습니다.</font>")
												.css('border',
														'1px solid Gray')
									}
										},
										error : function(error) {
											alert("정보를 다시 입력해주세요.")
										}
									});
						});
	});

</script>
</head>
<body>



	<div class="container">
		<br>
		<!-- Header -->
		<header id="header">
			<nav class="left">
				<a href="#menu"><span>Menu</span></a>
			</nav>
			<a href="chaos" class="logo">CHAOS</a>
			<nav class="right">
				<a href="login" class="button alt">Log in</a>
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<ul class="links">
				<li><a href="chaos">Home</a></li>
				<li><a href="mypage">Mypage</a></li>
			</ul>
			<ul class="actions vertical">
				<li><c:if test="${Nick == null }">
						<a href="login" class="button fit">Login</a>
					</c:if> <c:if test="${Nick != null }">
						<a href="logout" class="button fit">Logout</a>
					</c:if></li>
			</ul>
		</nav>

		<!-- //Header -->
		<hr>

		<div class="row">

			<aside class="col-sm-4">

				<div class="card">
					<article class="card-body">
						<h4 class="card-title mb-4 mt-1">Look for</h4>
						<p>
							<a href="" class="btn btn-block btn-outline-primary"> <i
								class="fab fa-facebook-f"></i>   페이스북으로 로그인
							</a>
						</p>
						<hr>
						<form>
							<!-- form-group// -->
							<div class="form-group">
								<input name="" class="form-control" placeholder="Email"
									type="email" id="email">
								<h4 id="EmCheck"></h4>
								<button type="button" class="btn btn-primary btn-block"
									id="sendE">인증번호 받기</button>
							</div>
							<h5 id="chkID"></h5>
							<!-- form-group// -->
							<div class="form-group">
								<input class="form-control" placeholder="인증번호 입력" type="text"
									id="IauthKey"> <small id="NumCheck"></small>
							</div>
							<!-- form-group// -->
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<button type="button" class="btn btn-primary btn-block"
											id="Find_Id">조회하기</button>
									</div>
									<!-- form-group// -->
								</div>
							</div>
							<!-- .row// -->
						</form>
					</article>
				</div>
				<!-- card.// -->
			</aside>
			<!-- col.// -->

		</div>
		<!-- row.// -->

	</div>
	<!--container end.//-->

	<br>
	<br>
	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<h2>Create HSH And ONG SNS</h2>
			<ul class="actions">
				<li><span class="icon fa-phone"></span> <a
					href="tel:010-4720-5289">전화 문의</a></li>
				<li><span class="icon fa-envelope"></span> <a target="#"
					href="https://open.kakao.com/o/s6VArW1c">카카오톡 문의하기</a></li>
				<li><span class="icon fa-map-marker"></span> 카카오,네이버,구글 거기서보자</li>
			</ul>
		</div>
		<div class="copyright">
			&copy; Untitled. Design <a href="https://templated.co">TEMPLATED</a>.
			Images <a href="https://unsplash.com">Unsplash</a>.
		</div>
	</footer>
	<!--// Footer -->

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.smooth-scroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</body>
</html>