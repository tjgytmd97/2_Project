<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
</head>

<body>
    <!-- 헤더고정 -->
    <div id="login_header"> </div>

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

    <div class="row align-items-end" style="margin-left: 300px;">
        <!-- 달력 -->
        <section id="defaultCal"></section>

        <!-- 취득 자격증 구현(수정) -->
        <div class="sidebar-widget-area">
            <h5 class="title" style="margin-right: 500px;">취득 자격증</h5>

            <div class="widget-content">

                <!-- Single Blog Post -->
                <div class="single-blog-post d-flex align-items-center widget-post">
                    <!-- Post Thumbnail -->
                    <div class="post-thumbnail">
                    <!-- 자격증 이름 나올 곳 -->
                    	<h6>정처기</h6>              
                    </div>
                </div>
                <!-- Single Blog Post -->
                <div class="single-blog-post d-flex align-items-center widget-post">
                    <!-- Post Thumbnail -->
                    <div class="post-thumbnail">
                        <img src="img/blog-img/lp4.jpg" alt="">
                    </div>
                    <!-- Post Content -->
                    <div class="post-content">
                        <a href="#" class="post-tag">Lifestyle</a>
                        <h4><a href="#" class="post-headline">A sunday in the park</a></h4>
                        <div class="post-meta">
                            <p><a href="#">12 March</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 취득 자격증 구현 끝! -->
        <!-- ##### Blog Wrapper Start ##### -->
        <div class="blog-wrapper section-padding-100 clearfix">

            <div class="container">
                <div class="row">
                    <div class="col-12 col-lg-9">

                        <!-- Single Blog Area  -->
                        <div class="single-blog-area blog-style-2 mb-50 wow fadeInUp" data-wow-delay="0.2s"
                            data-wow-duration="1000ms">
                            <div class="row align-items-center">
                                <div class="col-12 col-md-6">
                                    <div class="single-blog-thumbnail">
                                        <img src="img/blog-img/3.jpg" alt="">
                                        <div class="post-date">
                                            <a href="#">12 <span>march</span></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <!-- Blog Content -->
                                    <div class="single-blog-content">
                                        <div class="line"></div>
                                        <a href="#" class="post-tag">Lifestyle</a>
                                        <h4><a href="#" class="post-headline">Party people in the house</a></h4>
                                        <p>Curabitur venenatis efficitur lorem sed tempor. Integer aliquet tempor
                                            cursus. Nullam vestibulum convallis risus vel condimentum. Nullam auctor
                                            lorem in libero luctus, vel volutpat quam tincidunt.</p>
                                        <div class="post-meta">
                                            <p>By <a href="#">james smith</a></p>
                                            <p>3 comments</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        
                    </div>

                    <!-- ##### Sidebar Area ##### -->
                    <div class="col-12 col-md-4 col-lg-3">
                        <div class="post-sidebar-area">

                            <!-- 취득 자격증 구현(수정) -->
                            <div class="sidebar-widget-area">
                                <h5 class="title">취득 자격증</h5>

                                <div class="widget-content">

                                    <!-- Single Blog Post -->
                                    <div class="single-blog-post d-flex align-items-center widget-post">
                                        <!-- Post Thumbnail -->
                                        <div class="post-thumbnail">
                                            <img src="img/blog-img/lp1.jpg" alt="">
                                        </div>
                                        <!-- Post Content -->
                                        <div class="post-content">
                                            <a href="#" class="post-tag">Lifestyle</a>
                                            <h4><a href="#" class="post-headline">Party people in the house</a></h4>
                                            <div class="post-meta">
                                                <p><a href="#">12 March</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Blog Post -->
                                    <div class="single-blog-post d-flex align-items-center widget-post">
                                        <!-- Post Thumbnail -->
                                        <div class="post-thumbnail">
                                            <img src="img/blog-img/lp4.jpg" alt="">
                                        </div>
                                        <!-- Post Content -->
                                        <div class="post-content">
                                            <a href="#" class="post-tag">Lifestyle</a>
                                            <h4><a href="#" class="post-headline">A sunday in the park</a></h4>
                                            <div class="post-meta">
                                                <p><a href="#">12 March</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 취득 자격증 구현 끝! -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ##### Blog Wrapper End ##### -->

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