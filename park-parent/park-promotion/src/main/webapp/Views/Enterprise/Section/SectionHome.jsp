<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--企业网站header-->
<div class="banner w3l section" data-anchor="home" id="home_page">
    <!--企业网站banner-->
    <div class="banner-slider w3ls">
        <div class="callbacks_container">

            <ul class="rslides" id="slider4">
                <li>
                    <div class="banner-info wthree fadeInUp animated" data--delay=".5s"
                         style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                        <img src="/Content/images/company/b1.jpg?v=${static_resource_version}">
                        <div class="banner-content">
                            <h3>携手共进，合作共赢</h3>
                            <p>万为体育平台，是中国体育场馆，体育赛事，体育培训管理系统的领航者；招募全国的合作伙伴。</p>
                            <div>
                                <a class="btn btn-info" href="javascript:;">我要合作</a>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="banner-info wthree fadeInUp animated" data--delay=".5s"
                         style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                        <img src="/Content/images/company/b2.jpg?v=${static_resource_version}">
                        <div class="banner-content">
                            <h3>活动推荐2</h3>
                            <p>轮播1描述轮播1描述轮播1描述，轮播1描述轮播1描述轮播1描述轮播1描述。</p>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="banner-info wthree fadeInUp animated" data--delay=".5s"
                         style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                        <img src="/Content/images/company/b3.jpg?v=${static_resource_version}">
                        <div class="banner-content">
                            <h3>活动推荐3</h3>
                            <p>轮播1描述轮播1描述轮播1描述，轮播1描述轮播1描述轮播1描述轮播1描述。</p>
                        </div>
                    </div>
                </li>
            </ul>

        </div>
        <script src="Content/lib/jquery/ResponsiveSlides/responsiveslides.min.js?v=${static_resource_version}"></script>
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
