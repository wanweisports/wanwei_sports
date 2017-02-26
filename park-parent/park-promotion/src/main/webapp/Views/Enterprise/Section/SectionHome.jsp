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
                    <div class="banner-info wthree fadeInUp animated animated" data--delay=".5s"
                         style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                        <h3>轮播1</h3>
                        <p>轮播1描述轮播1描述轮播1描述，轮播1描述轮播1描述轮播1描述轮播1描述。</p>
                    </div>
                </li>
                <li>
                    <div class="banner-info wthree fadeInUp animated animated" data--delay=".5s"
                         style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                        <h3>轮播2</h3>
                        <p>轮播2描述轮播1描述轮播1描述，轮播1描述轮播1描述轮播1描述轮播1描述。</p>
                    </div>
                </li>
                <li>
                    <div class="banner-info wthree fadeInUp animated animated" data--delay=".5s"
                         style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                        <h3>轮播3</h3>
                        <p>轮播3描述轮播1描述轮播1描述，轮播1描述轮播1描述轮播1描述轮播1描述。</p>
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
