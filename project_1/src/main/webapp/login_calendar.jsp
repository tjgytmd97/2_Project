<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Original - Lifestyle Blog Template</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">

<!-- 달력 관련 파일 -->
<link rel="stylesheet" type="text/css" href="./css/pratice_class.css" />
<script src="./js/practice_class.js" type="module"> </script>
<style>
.YM {
	height: 15%;
	width: 100%;
}

.tbl_cal {
	height: 70%;
	width: 90%;
}
</style>
</head>
<body>
	<!-- 헤더고정 -->
	<div id="login_header"></div>

	<script>
        async function fetchHtmlAsText(url) {
            return await (await fetch(url)).text();
        }

        async function importPage(target) {
            document.querySelector('#' + target).innerHTML = await fetchHtmlAsText(target + '.jsp');
        }
        importPage("login_header")
        

    </script>
	<!-- 헤더고정 끝 -->

	<div class="row align-items-end" style="margin-left: 50px;">
		<!-- 달력 -->
		<section id="defaultCal" style="height: 920px; width: 60%; top: 70px;"></section>
		<!-- 취득 자격증 구현(수정) -->
		<div class="sidebar-widget-area" style="margin: 50px 200px 50px 1px;">
			<div style="margin-bottom: 50px;">
				<h2 class="title">내가 취득한 자격증</h2>
				<div class="widget-content"
					style="border: 1px solid black; width: 300px;">
					<!-- Single Blog Post -->
					<div class="single-blog-post d-flex align-items-center widget-post">
						<!-- Post Content -->
						<div class="post-content">
							<h4>
								<a href="#" class="post-headline">자격증1</a>
							</h4>
						</div>
					</div>
					<!-- Single Blog Post -->
					<div class="single-blog-post d-flex align-items-center widget-post">
						<!-- Post Content -->
						<div class="post-content">
							<h4>
								<a href="#" class="post-headline">자격증2</a>
							</h4>
						</div>
					</div>
				</div>
			</div>
			<div style="margin-bottom: 50px;">
				<h2 class="title">디데이</h2>
				<div class="widget-content"
					style="border: 1px solid black; width: 300px;">
					<!-- Single Blog Post -->
					<div class="single-blog-post d-flex align-items-center widget-post">
						<!-- Post Content -->
						<div class="post-content">
							<h4>
								<a href="#" class="post-headline">디데이1</a>
							</h4>
						</div>
					</div>
					<!-- Single Blog Post -->
					<div class="single-blog-post d-flex align-items-center widget-post">
						<!-- Post Content -->
						<div class="post-content">
							<h4>
								<a href="#" class="post-headline">디데이2</a>
							</h4>
						</div>
					</div>
				</div>
			</div>
			<div style="margin-bottom: 50px;">
				<h2 class="title">자격증 추천</h2>
				<div class="widget-content"
					style="border: 1px solid black; width: 300px;">
					<!-- Single Blog Post -->
					<div class="single-blog-post d-flex align-items-center widget-post">
						<!-- Post Content -->
						<div class="post-content">
							<h4>
								<a href="#" class="post-headline">추천1</a>
							</h4>
						</div>
					</div>
					<!-- Single Blog Post -->
					<div class="single-blog-post d-flex align-items-center widget-post">
						<!-- Post Content -->
						<div class="post-content">
							<h4>
								<a href="#" class="post-headline">추천2</a>
							</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- jQuery (Necessary for All JavaScript Plugins) -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="js/plugins.js"></script>
	<!-- Active js -->
	<script src="js/active.js"></script>
</body>
</html>