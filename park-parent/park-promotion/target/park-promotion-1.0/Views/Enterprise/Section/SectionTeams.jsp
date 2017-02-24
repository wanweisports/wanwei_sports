<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--start-banner-bottom-->
<!--/reviews-->
<div id="review" class="reviews agile-1">
    <div class="test-monials" id="testimonials">
        <h3 class="tittle">公司团队</h3>
        <!--//screen-gallery-->
        <div class="sreen-gallery-cursual">
            <!-- required-js-files-->
            <link href="/Content/lib/jquery/owl-carousel/owl.carousel.css?v=${static_resource_version}" rel="stylesheet">
            <script src="/Content/lib/jquery/owl-carousel/owl.carousel.js?v=${static_resource_version}"></script>
            <script>
                $(document).ready(function() {
                    $("#owl-demo").owlCarousel({
                        items : 1,
                        lazyLoad : true,
                        autoPlay : true,
                        navigation : false,
                        navigationText : false,
                        pagination : true
                    });
                });
            </script>
            <!--//required-js-files-->
            <div id="owl-demo" class="owl-carousel">
                <div class="item-owl">
                    <div class="test-review wow fadeInUp animated animated" data-wow-delay=".5s"
                         style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                        <p><img src="/Content/images/left-quotes.png?v=${static_resource_version}" alt=""> Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. <img src="/Content/images/right-quotes.png?v=${static_resource_version}" alt=""></p>
                        <img src="/Content/images/t3.jpg?v=${static_resource_version}" class="img-responsive" alt=""/>
                        <h5>Henry</h5>
                    </div>
                </div>
                <div class="item-owl">
                    <div class="test-review wow fadeInUp animated animated" data-wow-delay=".5s"
                         style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                        <p> <img src="/Content/images/left-quotes.png?v=${static_resource_version}" alt="">Polite sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.<img src="/Content/images/right-quotes.png?v=${static_resource_version}" alt=""></p>
                        <img src="/Content/images/t2.jpg?v=${static_resource_version}" class="img-responsive" alt=""/>
                        <h5>Smith</h5>
                    </div>
                </div>
                <div class="item-owl">
                    <div class="test-review wow fadeInUp animated animated" data-wow-delay=".5s"
                         style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                        <p><img src="/Content/images/left-quotes.png?v=${static_resource_version}" alt=""> Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. <img src="/Content/images/right-quotes.png?v=${static_resource_version}" alt=""></p>
                        <img src="/Content/images/t1.jpg?v=${static_resource_version}" class="img-responsive" alt=""/>
                        <h5>Steave</h5>
                    </div>
                </div>
            </div>
            <!--//screen-gallery-->
        </div>
    </div>
    <div class="clearfix"> </div>
</div>
<!--//reviews-->
