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

<!-- 마이켈린더 -->  
    <link href='./fullcalendar-5.11.3/lib/main.css' rel='stylesheet' />
	<script src='./fullcalendar-5.11.3/lib/main.js'></script>
	
	<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          contentHeight: 600,//캘린더 크기 설정
          editable: true,//수정 여부
          locale:'ko',
          dateClick: function() {
        	    alert('a day has been clicked!');
        	  },
          events: [
            {
              title  : 'event2',
              start  : '2022-09-05',
              end    : '2022-09-07'
            },
            {
              title  : 'event3',
              start  : '2010-01-09T12:30:00',
              allDay : false // will make the time show
            }
          ]
        ,eventClick:function(info){
            window.location.href(info.event.url);
            }
        });
        calendar.render();
        
      });
      
	</script>

<style>
.YM {
	height: 15%;
	width: 100%;
}

.tbl_cal {
	height: 70%;
	width: 90%;
}

.background {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.3);
	z-index: 1000;
	/* 숨기기 */
	z-index: -1;
	opacity: 0;
}

.show {
	opacity: 1;
	z-index: 1000;
	transition: all 0.5s;
}

.window {
	position: relative;
	width: 100%;
	height: 100%;
}

.popup {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #ffffff;
	box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
	/* 임시 지정 */
	width: 100px;
	height: 100px;
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
}

.show .popup {
	transform: translate(-50%, -50%);
	transition: all 0.5s;
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
		<div id="calendar" style="height: 920px; width: 60%; margin-bottom: auto; margin-right: auto;"></div>
		<!-- 취득 자격증 구현(수정) -->
		<div class="sidebar-widget-area" style="margin: 50px 200px 50px 1px;">
			<div style="margin-bottom: 50px;">
				<button id="show">취득자격증</button>
				<div class="background">
					<div class="window">
						<div class="popup">
							<button id="close">팝업닫기</button>
						</div>
						<div>
							<div></div>
						</div>
					</div>
				</div>
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
	<!-- 모달 스크립트 -->
	<script>
	function show() { document.querySelector(".background").className =
	"background show"; } function close() {
	document.querySelector(".background").className = "background"; }

	document.querySelector("#show").addEventListener("click", show);
	document.querySelector("#close").addEventListener("click", close);</script>
</body>
</html>