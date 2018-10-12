<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js"> <!--<![endif]-->

<head>

        <!-- Basics -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>登录成功</title>
        <link name="author" href="humans.txt" />
        <meta name="description" content="John Deo, UI / UX / Frontend">

        <!-- Favicons -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath }/user/img/favicons/favicon.ico">

        <!-- Mobile -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        
        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/user/css/normalize.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/user/css/main.css">

        <!-- Fonts -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Lato:300,400,700'>

    </head>
    <body>   

        <div class="wrapper">

            <header>
                <a class="menu-icon jiji">
                    <span></span>
                </a>
                <nav class="menu visuallyhidden">
                    <ul>
                        <li><a href="#home">Home</a></li>
                        <li><a href="#about">About me</a></li>
                        <li><a href="#work">My Works</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </nav>
            </header>

            <section id="home" class="row">
                <div class="overlay">
                    <div class="col home-title jiji">
                        <h1>登录成功</h1>
                        <h2>${user.ser_ip }</h2>
                        <a href="${pageContext.request.contextPath }/user/logout.action" class="but">退&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;出</a>
                    </div>
                </div>
            </section>

            <section id="about" class="row">
                <div class="page about-content">
                    <div class="col about-title">
                        <h3
                            data-100="-webkit-transform: translateX(100px); opacity:0;"
                            data-500="-webkit-transform: translateX(0px); opacity:1;"
                        >About me</h3>
                    </div>
                    <div class="col empty">&nbsp;</div>
                    <div class="col about-description">
                        <p
                            data-100="opacity:0;"
                            data-500="opacity:1;"
                        >Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris.</p>
                        <a href="#" class="but">Get in touch</a>
                    </div>
                    <div class="col empty">&nbsp;</div>
                </div>
            </section>

            <section id="services" class="row">
                <div class="services-content page">
                    <div class="col services-design"
                        data-600="-webkit-transform: translateY(10px); opacity:0;"
                        data-800="-webkit-transform: translateY(0px); opacity:1;"
                    >
                        <span class="icon-design"></span>
                        <ul>
                            <li>UI / UX Design</li>
                            <li>User Interface Design</li>
                            <li>Interaction Design</li>
                            <li>User Experience Thinking</li>
                            <li>Prototyping</li>
                            <li>Wireframing</li>
                        </ul>
                    </div>
                    <div class="col services-frontend"
                        data-600="-webkit-transform: translateY(50px); opacity:0;"
                        data-800="-webkit-transform: translateY(0px); opacity:1;"
                    >
                        <span class="icon-computer"></span>
                        <ul>
                            <li>Frontend Development</li>
                            <li>HTML5 / CSS3</li>
                            <li>jQuery & JavaScript libraries</li>
                            <li>Responsive Design</li>
                            <li>Sass</li>
                            <li>Git / SVN</li>
                        </ul>
                    </div>
                    <div class="col services-team"
                        data-600="-webkit-transform: translateY(100px); opacity:0;"
                        data-800="-webkit-transform: translateY(0px); opacity:1;"
                    >
                        <span class="icon-music"></span>
                        <ul>
                            <li>Team Building</li>
                            <li>Smiling</li>
                            <li>Communication</li>
                            <li>Team working</li>
                            <li>Sharing my music</li>
                            <li>...and more!</li>
                        </ul>
                    </div>
                </div>
            </section>

            <hr><div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>

            <section id="work" class="row">
                <div class="work-content page">
                    <div class="col work-title">
                        <h3
                            data-900="-webkit-transform: translateX(-100px); opacity:0;"
                            data-1300="-webkit-transform: translateX(0px); opacity:1;"
                        >My latest work</h3>
                    </div>
                    <div class="col empty">&nbsp;</div>
                    <div class="col work-description">
                        <p
                            data-900="opacity:0;"
                            data-1300="opacity:1;"
                        >A selection of recent projects I've been working on: landing pages, websites, email marketing...</p>
                    </div>
                    <div class="col empty">&nbsp;</div>
                </div>
                <div class="work-examples page">
                    <div class="col work-item"
                        data-1300="opacity:0;"
                        data-1400="opacity:1;"
                    >
                        <img src="${pageContext.request.contextPath }/user/img/works/1.jpg" alt="">
                        <div class="work-item-inside">
                            <div class="work-item-inside-content">
                                <h4>Design</h4>
                                <a href="#" class="but">Click here</a>
                            </div>
                        </div>
                    </div>
                    <div class="col work-item"
                        data-1300="opacity:0;"
                        data-1400="opacity:1;"
                    >
                        <img src="${pageContext.request.contextPath }/user/img/works/1.jpg" alt="">
                        <div class="work-item-inside">
                            <div class="work-item-inside-content">
                                <h4>Design</h4>
                                <a href="#" class="but">Click here</a>
                            </div>
                        </div>
                    </div>
                    <div class="col work-item"
                        data-1300="opacity:0;"
                        data-1600="opacity:1;"
                    >
                        <img src="${pageContext.request.contextPath }/user/img/works/1.jpg" alt="">
                        <div class="work-item-inside">
                            <div class="work-item-inside-content">
                                <h4>Design</h4>
                                <a href="#" class="but">Click here</a>
                            </div>
                        </div>
                    </div>
                    <div class="col work-item"
                        data-1300="opacity:0;"
                        data-1400="opacity:1;"
                    >
                        <img src="${pageContext.request.contextPath }/user/img/works/1.jpg" alt="">
                        <div class="work-item-inside">
                            <div class="work-item-inside-content">
                               <h4>Design</h4>
                               <a href="#" class="but">Click here</a>
                            </div>
                        </div>
                    </div>
                    <div class="col work-item"
                        data-1300="opacity:0;"
                        data-1500="opacity:1;"
                    >
                        <img src="${pageContext.request.contextPath }/user/img/works/1.jpg" alt="">
                        <div class="work-item-inside">
                            <div class="work-item-inside-content">
                                <h4>Design</h4>
                                <a href="#" class="but">Click here</a>
                            </div>
                        </div>
                    </div>
                    <div class="col work-item"
                        data-1300="opacity:0;"
                        data-1600="opacity:1;"
                    >
                        <img src="${pageContext.request.contextPath }/user/img/works/1.jpg" alt="">
                        <div class="work-item-inside">
                            <div class="work-item-inside-content">
                                <h4>Design</h4>
                                <a href="#" class="but">Click here</a>
                            </div>
                        </div>
                    </div>                    
                </div>
            </section>

            <hr>

            <section id="contact" class="row">
                <div class="contact-content page">
                    <div class="col contact-title">
                        <h3
                            data-100="-webkit-transform: translateX(100px); opacity:0;"
                            data-500="-webkit-transform: translateX(0px); opacity:1;"
                        >Get in touch</h3>
                    </div>
                    <div class="col empty">&nbsp;</div>
                    <div class="col contact-description">
                        <a href="#" class="but">hello@afrussel.com</a>
                    </div>
                    <div class="col empty">&nbsp;</div>
                    <div class="col span_12 social">
                        <a class="icon-twitter" href="#" target="_blank"></a>
                        <a class="icon-github" href="#" target="_blank"></a>
                        <a class="icon-instagram" href="#" target="_blank"></a>
                        <a class="icon-linkedin" href="#" target="_blank"></a>
                    </div>
                </div>
            </section>

            <footer id="footer" class="row">
                <div class="footer-content page">
                    <div class="col f1">
                        <p>© 2015 John Deo. Made with love.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
                    </div>
                </div>
            </footer>

        </div>

        <div class="loader"></div>
        
        <!-- JavaScript -->
        <script src="js/jquery-1.11.0.min.js"></script>
        <script src="js/modernizr-2.6.2.min.js"></script>
        <script src="js/skrollr.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>