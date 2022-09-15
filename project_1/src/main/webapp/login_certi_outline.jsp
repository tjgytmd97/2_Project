<%@page import="domain.Certificate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- 모두의 자격증 -->
<title>자격증 상세 페이지</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>


</head>

<body>
	<% 
		// 1. 세션에 저장된 로그인 정보 가져오기
		// 형변환(다운캐스팅) 해주기
		String id = (String)session.getAttribute("id");
	
		// 세션에 저정된 vo 가져오기
		Certificate vo = (Certificate)session.getAttribute("vo");
	%>
	<!-- 헤더고정 -->
	<div id="login_header"></div>
	<script>
        async function fetchHtmlAsText(url) {
            return await (await fetch(url)).text();
        }

        async function importPage(target) {
            document.querySelector('#' + target).innerHTML = await fetchHtmlAsText(target + '.html');
        }
        importPage("login_header")

    </script>
	<!-- 헤더고정 끝 -->

	<div class="single-blog-wrapper section-padding-0-100">

		<div class="container">
			<div class="row">
				<!-- 자격증 상세정보표시(수정) -->
				<div class="col-12 col-lg-9">
					<div class="single-blog-area blog-style-2 mb-50">
						<div class="single-blog-content">
							<div class="line"></div>
							<h4>
								<h2><%= vo.getCerti_name()%></h2>
							</h4>
							<div class="post-meta mb-50">
								<p style="font-size:large;">
									<%= vo.getCerti_instt() %> <br> 
									<a style="font-size:15px; " target="_blank" href="<%= vo.getCerti_instt_url() %>"><%= vo.getCerti_instt_url() %></a>
								</p>
							</div>
							<h5>1. 자격증 정보</h5>
							<p style="font-size:15px; "><%= vo.getCerti_outline()%></p>
							<div>
							<table style="width: 1000px;">
								<tr>
								<th style="padding-top:10px;">가격</th>
								<th style="padding-top:10px;">필기 원서 접수 기간</th>
								<th style="padding-top:10px;">필기 시험 기간</th>
								<th style="padding-top:10px;">필기 시험 발표일</th>
								</tr>
								
								<tr>
								<td style="padding-bottom:10px;"><%= vo.getCerti_fee() %></td>
								<td style="padding-bottom:10px;"><%= vo.getCerti_hndw_rcp_start_date() %>~<%= vo.getCerti_hndw_rcp_end_date() %></td>
								<td style="padding-bottom:10px;"><%= vo.getCerti_hndw_test_start_date() %>~<%= vo.getCerti_hndw_test_end_date() %></td>
								<td style="padding-bottom:10px;"><%= vo.getCerti_hndw_pass_start_date() %>~<%= vo.getCerti_hndw_pass_end_date() %></td>
								</tr>
								
								<tr>
								<th style="padding-top:10px;">실기 원서 접수 기간</th>
								<th style="padding-top:10px;">실기 시험 기간</th>
								<th style="padding-top:10px;">최종 합격 발표일</th>
								</tr>
								
								<tr>
								<td style="padding-bottom:10px;"><%= vo.getCerti_prctc_rcp_start_date() %>~<%= vo.getCerti_prctc_rcp_end_date() %></td>
								<td style="padding-bottom:10px;"><%= vo.getCerti_prctc_test_start_date()%>~<%= vo.getCerti_prctc_test_end_date()%></td>
								<td style="padding-bottom:10px;"><%= vo.getCerti_final_pass_start_date()%>~<%= vo.getCerti_final_pass_end_date()%></td>
								</tr>
							</table>
							</div>
						</div>
					</div>

					<!-- 댓글보기 기능 구현 (수정)-->
					<div class="comment_area clearfix mt-70">
						<h5 class="title">댓글</h5>

						<ol>
							<!-- 댓글내용(수정) -->
							<li class="single_comment_area">
								<div class="comment-content d-flex">
									<div class="comment-meta">
										<a href="#" class="post-date">날짜</a>
										<p>
											<a href="#" class="post-author">서효승</a>
										</p>
									</div>
								</div>
							</li>
						</ol>
					</div>

					<!-- 댓글달기 기능 구현(수정) -->
					<div class="post-a-comment-area mt-70">
						<h5>댓글달기</h5>
						<!-- Reply Form -->
						<form action="#" method="post">
							<div class="row">
								<div class="col-12">
									<div class="group">
										<textarea name="message" id="message" required></textarea>
										<span class="highlight"></span> <span class="bar"></span> <label>댓글</label>
									</div>
								</div>
								<div class="col-12">
									<button type="submit" class="btn original-btn">확인</button>
								</div>
							</div>
						</form>
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