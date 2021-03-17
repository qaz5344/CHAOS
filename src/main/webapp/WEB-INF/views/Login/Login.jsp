<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 메인 -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카오스 SNS</title>
<style>
.col-sm-4 {
	margin-top: 200px;
	margin: auto;
	min-width: 400px;
}
</style>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<!-- 	//메인 -->

<!------ Include the above in your HEAD tag ---------->

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />
	
	<script type="text/javascript">
$(function() {
    //idck 버튼을 클릭했을 때 
    $('#idchk').click(function() {
        //userid 를 param.
        var userid = $('#id').val();
        var userpw = $('#pw').val();
        $.ajax({
            async: true,
            type : 'POST',
            data : {userid,userpw},
            url : "idcheck",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.user != null) {
                	document.location="login_go?Id="+userid+"&Pw="+userpw;
                } else {
                	$("#loginfail")
					.html(
							"<font color=Red>일치하는 정보가 없습니다.</font>")
					.css('border',
							'1px solid Gray')
                }
            },
            error : function(error) {
                alert("error : " + error);
            }
        });
    });
}); 
</script>
	
</head>
<body>

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

	<aside class="col-sm-4">

		<div class="card">
			<article class="card-body">
				<a href="join" class="float-right btn btn-outline-primary">회원가입</a>
				<h4 class="card-title mb-4 mt-1">Sign in</h4>
				<p>
					<a href="" class="btn btn-block btn-outline-primary"> <i
						class="fab fa-facebook-f"></i>   페이스북으로 로그인
					</a>
				</p>
				<hr>
				<form action="login_go" method="POST">
					<div class="form-group">
						<input name="Id" class="form-control" placeholder="Email or login"
							type="text" id="id">
					</div>
					<!-- form-group// -->
					<div class="form-group">
						<input name="Pw" class="form-control" placeholder="******" type="password" id="pw">
					</div>
					<h5 id="loginfail"></h5>
					<!-- form-group// -->
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
									<button type="button" class="btn btn-primary btn-block" id="idchk">
                           Login</button> <!-- 추가된 버튼이 이거 -->
							</div>
							<!-- form-group// -->
						</div>
						<div class="col-md-6 text-right">
						<a class="small" href="hhelp">Forgot id?</a><br>
							<a class="small" href="help">Forgot password?</a>
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