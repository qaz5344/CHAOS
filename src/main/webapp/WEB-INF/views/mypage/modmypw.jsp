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
		//current password 벗어낫을때
		$("#cpw")
				.blur(
						function() {
							//userid 를 param.
							var id = $('#uid').val();
							var email = $('#uem').val();
							var pw = $('#cpw').val();
							var form={
									id,
									email,
									pw,
							};
							$
									.ajax({
										async : true,
										type : 'POST',
										data : form,
										url : "pwck",
										success : function(data) {
											switch (data.cnt) {
											case 0:
												$('#Pwinfo')
														.html(
																"<font color=Red>비밀번호가 일치하지 않습니다.</font> ")
														.css('border',
																'1px solid black')
												//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
												$("#divInputId").addClass(
														"has-success")
												$("#divInputId").removeClass(
														"has-error")
												$("#cpw").focus();
												break;
											case 1:
												$('#Pwinfo')
														.html(
																"<font color=Blue>비밀번호가 일치합니다.</font> ")
														.css('border',
																'1px solid black')
												//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
												$("#divInputId").addClass(
														"has-error")
												$("#divInputId").removeClass(
														"has-success")
												$("#upw").focus();
												break;
											
											}

										},
										error : function(error) {
											$('#Pwinfo')
													.html(
															"<font color=Red>필수 입력사항 입니다.</font> ")
													.css('border',
															'1px solid black')
											//아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
											$("#divInputId").addClass(
													"has-error")
											$("#divInputId").removeClass(
													"has-success")
											$("#cpw").focus();
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
				<a href="logout" class="button alt">Log out</a>
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
				<h4 class="card-title mt-3 text-center">회원 정보 수정</h4>
				<p class="text-center">Get started with your free account</p>
				<form action="modpw">
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input name="Id" class="form-control" 
							type="text" id="uid" value="${Id }" readonly>
					</div>
					<h5 id="idinfo"></h5>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-envelope"></i>
							</span>
						</div>
						<input id="uem" name="Email" class="form-control"
							type="email" value="${Email }" readonly>
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input name="Nick" class="form-control" value="${Nick }"
							type="text" id="ninm" readonly>
					</div>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input id="cpw" name="cPw" class="form-control"
							placeholder="Current password" type="password" >
					</div>
					<h5 id="Pwinfo"></h5>
					<!-- form-group// -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input id="npw" name="Pw" class="form-control"
							placeholder="New password" type="password">
					</div>
					<!-- form-group// -->
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block">
							Modify Account</button>
					</div>
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