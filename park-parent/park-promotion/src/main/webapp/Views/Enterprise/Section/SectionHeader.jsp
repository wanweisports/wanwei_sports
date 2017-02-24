<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--企业网站header-->
<div class="banner w3l" id="home">
    <div class="header-bottom">
        <div class="container">
            <div class="fixed-header">

                <!--网站logo-->
                <div class="logo">
                    <a href="/enterprise/index">
                        <h1>场馆<img src="/Content/images/logo.png?v=${static_resource_version}">时代</h1>
                    </a>
                </div>
                <!--//网站logo-->

                <!--网站navigator-->
                <div class="top-menu">
                    <span class="menu"></span>
                    <nav class="link-effect-4" id="link-effect-4">
                        <ul>
                            <li class="active">
                                <a data-hover="公司首页" href="#home">公司首页</a>
                            </li>
                            <li>
                                <a data-hover="公司产品" href="#services" class="scroll">公司产品</a>
                            </li>
                            <li>
                                <a data-hover="公司介绍" href="#about" class="scroll">公司介绍</a>
                            </li>
                            <li>
                                <a data-hover="公司合作" href="#gallery" class="scroll">合作场馆</a>
                            </li>
                            <li>
                                <a data-hover="公司团队" href="#testimonials" class="scroll">公司团队</a>
                            </li>
                            <li>
                                <a data-hover="联系我们" href="#contact" class="scroll">联系我们</a>
                            </li>
                            <li>
                                <a data-hover="场馆运营管理系统" href="http://localhost:8080" target="_blank">场馆运营管理系统</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <script type="text/javascript">
                    $(document).ready(function () {
                        // 导航菜单切换动画
                        $("span.menu").click(function () {
                            $(".top-menu ul").slideToggle("normal" , function () {});
                        });

                        // 滚动
                        var navOffset = $(".header-bottom").offset().top;

                        $(window).scroll(function(){
                            var scrollPosition = $(window).scrollTop();

                            if(scrollPosition > (navOffset + 5)){
                                $(".header-bottom").addClass("fixed");
                            }else{
                                $(".header-bottom").removeClass("fixed");
                            }
                        });

                    });
                </script>
                <!--//网站navigator-->

                <div class="clearfix"></div>

            </div>
        </div>
    </div>

    <!--企业网站banner-->
    <div class="banner-slider w3ls">
        <div class="callbacks_container">

            <ul class="rslides" id="slider4">
                <li>
                    <div class="banner-info wthree wow fadeInUp animated animated" data-wow-delay=".5s"
                         style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                        <h3>轮播1</h3>
                        <p>轮播1描述轮播1描述轮播1描述，轮播1描述轮播1描述轮播1描述轮播1描述。</p>
                    </div>
                </li>
                <li>
                    <div class="banner-info wthree wow fadeInUp animated animated" data-wow-delay=".5s"
                         style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                        <h3>轮播2</h3>
                        <p>轮播2描述轮播1描述轮播1描述，轮播1描述轮播1描述轮播1描述轮播1描述。</p>
                    </div>
                </li>
                <li>
                    <div class="banner-info wthree wow fadeInUp animated animated" data-wow-delay=".5s"
                         style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                        <h3>轮播3</h3>
                        <p>轮播3描述轮播1描述轮播1描述，轮播1描述轮播1描述轮播1描述轮播1描述。</p>
                    </div>
                </li>
            </ul>

        </div>
        <script src="/Content/lib/jquery/ResponsiveSlides/responsiveslides.min.js?v=${static_resource_version}"></script>
        <script>
            $(function () {
                $("#slider4").responsiveSlides({
                    auto: true,
                    pager: true,
                    nav: false,
                    speed: 500,
                    namespace: "callbacks",
                    before: function () {},
                    after: function () {}
                });
            });
        </script>

    </div>
    <!--//企业网站banner-->
</div>
<!--//企业网站header-->
