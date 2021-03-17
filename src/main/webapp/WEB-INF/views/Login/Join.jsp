<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카오스 SNS</title>
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
	$(function() {
		$("#uid")
				.blur(
						function() {
							//userid 를 param.
							var userid = $("#uid").val();
							$
									.ajax({
										async : true,
										type : 'POST',
										data : userid,
										url : "idck",
										dataType : "json",
										contentType : "application/json; charset=UTF-8",
										success : function(data) {
											switch (data.cnt) {
											case 0:
												$('#idinfo')
														.html(
																"<font color=Blue>사용가능한 아이디입니다.</font> ")
														.addClass('idchk')
														.css('border',
																'1px solid black')
												//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
												$("#divInputId").addClass(
														"has-success")
												$("#divInputId").removeClass(
														"has-error")
												$("#uem").focus();
												break;
											case 1:
												$('#idinfo')
														.html(
																"<font color=Red>아이디가 존재합니다.</font> ")
														.addClass('idchk')
														.css('border',
																'1px solid black')
												//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
												$("#divInputId").addClass(
														"has-error")
												$("#divInputId").removeClass(
														"has-success")
												$("#uid").focus();
												break;
											case 3:
												$('#idinfo')
														.html(
																"<font color=Red>20글자 미만입니다.</font> ")
														.addClass('idchk')
														.css('border',
																'1px solid black')
												//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
												$("#divInputId").addClass(
														"has-error")
												$("#divInputId").removeClass(
														"has-success")
												$("#uid").focus();
											case 4:
												$('#idinfo')
														.html(
																"<font color=Red>2글자 이상입니다.</font> ")
														.addClass('idchk')
														.css('border',
																'1px solid black')
												//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
												$("#divInputId").addClass(
														"has-error")
												$("#divInputId").removeClass(
														"has-success")
												$("#uid").focus();
												break;
											}
										},
										error : function(error) {
											$('#idinfo')
													.html(
															"<font color=Red>필수입력 사항입니다.</font> ")
													.addClass('idchk').css(
															'border',
															'1px solid black')
											//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
											$("#divInputId").addClass(
													"has-error")
											$("#divInputId").removeClass(
													"has-success")
											$("#uid").focus();
										}
									});
						});
	});
	$(function() {
		//idck 버튼을 클릭했을 때 
		$("#ninm")
				.blur(
						function() {
							//userid 를 param.
							var uni = $("#ninm").val();
							$
									.ajax({
										async : true,
										type : 'POST',
										data : uni,
										url : "nick",
										dataType : "json",
										contentType : "application/json; charset=UTF-8",
										success : function(data) {
											switch (data.cnt) {
											case 0:
												$('#Niinfo')
														.html(
																"<font color=Blue>사용가능한 닉네임입니다.</font> ")
														.css('border',
																'1px solid black')
												//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
												$("#divInputId").addClass(
														"has-success")
												$("#divInputId").removeClass(
														"has-error")
												$("#upw").focus();
												break;
											case 1:
												$('#Niinfo')
														.html(
																"<font color=Red>닉네임이 존재합니다.</font> ")
														.css('border',
																'1px solid black')
												//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
												$("#divInputId").addClass(
														"has-error")
												$("#divInputId").removeClass(
														"has-success")
												$("#ninm").focus();
												break;
											case 3:
												$('#Niinfo')
														.html(
																"<font color=Red>10글자 미만입니다.</font> ")
														.css('border',
																'1px solid black')
												//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
												$("#divInputId").addClass(
														"has-error")
												$("#divInputId").removeClass(
														"has-success")
												$("#ninm").focus();
												break;
											case 4:
												$('#Niinfo')
														.html(
																"<font color=Red>2글자 이상입니다.</font> ")
														.css('border',
																'1px solid black')
												//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
												$("#divInputId").addClass(
														"has-error")
												$("#divInputId").removeClass(
														"has-success")
												$("#ninm").focus();
												break;
											}

										},
										error : function(error) {
											$('#Niinfo')
													.html(
															"<font color=Red>필수 입력사항 입니다.</font> ")
													.css('border',
															'1px solid black')
											//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
											$("#divInputId").addClass(
													"has-error")
											$("#divInputId").removeClass(
													"has-success")
											$("#ninm").focus();
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
				<li><a href="#" class="button fit">Login</a></li>
			</ul>
		</nav>

		<!-- //Header -->
		<hr>
		<div class="card bg-light">
			<article class="card-body mx-auto" style="max-width: 400px;">
				<h4 class="card-title mt-3 text-center">회원 가입</h4>
				<p class="text-center">Get started with your free account</p>
				<p>
					<a href="" class="btn btn-block btn-facebook"> <i
						class="fab fa-facebook-f"></i>   페이스북으로 로그인
					</a>
				</p>
				<form action="signup">
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input name="Id" class="form-control" placeholder="Login ID"
							type="text" id="uid">
					</div>
					<h5 id="idinfo"></h5>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-envelope"></i>
							</span>
						</div>
						<input id="uem" name="Email" class="form-control"
							placeholder="Email address" type="email">
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input name="Nick" class="form-control" placeholder="Nick Name"
							type="text" id="ninm">
					</div>
					<h5 id="Niinfo"></h5>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input id="upw" name="Pw" class="form-control"
							placeholder="Create password" type="password">
					</div>
					<!-- form-group// -->
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block">
							Create Account</button>
					</div>
					<!-- form-group// -->
					<p class="text-center">
						Have an account? <a href="login">Log In</a>
					</p>
				</form>
			</article>
		</div>
		<!-- card.// -->

	</div>
	<!--container end.//-->

	<br>
	<br>
	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<h2>Create HSH And ONG SNS</h2>
			<ul class="actions">
				<li><span class="icon fa-phone"></span> <a href="tel:010-4720-5289">전화 문의</a></li>
				<li><span class="icon fa-envelope"></span> <a target="#" href="https://open.kakao.com/o/s6VArW1c">카카오톡 문의하기</a></li>
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