<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript">
	function resize(img) {
		// 원본 이미지 사이즈 저장
		var width = img.width;
		var height = img.height;

		// 가로, 세로 최대 사이즈 설정
		var maxWidth = 400; // 원하는대로 설정. 픽셀로 하려면 maxWidth = 100  이런 식으로 입력
		var maxHeight = 300; // 원래 사이즈 * 0.5 = 50%

		// 가로나 세로의 길이가 최대 사이즈보다 크면 실행  
		if (width > maxWidth || height > maxHeight) {

			// 가로가 세로보다 크면 가로는 최대사이즈로, 세로는 비율 맞춰 리사이즈
			if (width > height) {
				resizeWidth = maxWidth;
				resizeHeight = maxHeight;

				// 세로가 가로보다 크면 세로는 최대사이즈로, 가로는 비율 맞춰 리사이즈
			} else {
				resizeHeight = maxHeight;
				resizeWidth = maxWidth;
			}

			// 최대사이즈보다 작으면 원본 그대로
		} else {
			resizeWidth = width;
			resizeHeight = height;
		}

		// 리사이즈한 크기로 이미지 크기 다시 지정
		img.width = resizeWidth;
		img.height = resizeHeight;
	}
</script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
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
			<article class="card-body mx-auto"
				style="max-width: 400px; text-align: center">
				<h4 class="card-title mt-3 text-center">프로필 사진 수정</h4>

				<c:if test="${mDTO.pname == 'N' }">
					<img onload="resize(this)" style="height:45px"
						src="${pageContext.request.contextPath}/resources/images/default.png"
						alt="">
				</c:if>
				<c:if test="${mDTO.pname != 'N' }">
					<img onload="resize(this)"
						src="${pageContext.request.contextPath}/download?filename=${mDTO.pname}"
						alt="">
				</c:if>
				<form action="updatePP" enctype="multipart/form-data" method="post">
				<input type="hidden" name="pname" value="${mDTO.pname}">
				<div class="tab-pane" id="images">
					<div class="form-group">
						<div class="custom-file">
							<input type="file" name="file" class="custom-file-input"
								id="Fname" value="파일선택"> <label
								class="custom-file-label" for="customFile">Upload image</label>
						</div>
					</div>
					<div class="py-4"></div>
				</div>
				<div class="btn-group">
					<button type="submit" class="btn-primary" id="subbtn">등록하기</button>
				</div>
				</form>
			</article>

		</div>
		<!--container end.//-->

		<br> <br>
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