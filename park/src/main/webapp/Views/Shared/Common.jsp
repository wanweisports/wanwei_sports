<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script src="Content/lib/jquery/jquery-1.12.3.min.js"></script>
<script src="Content/lib/bootstrap/bootstrap.min.js"></script>
<script src="Content/lib/request.js"></script>
<script>
    $(document).ready(function(){

        $(".ww-nav > li").not(".nav-home").hover(function () {
            $(this).addClass("nav-moon");
        }, function () {
            $(this).removeClass("nav-moon");
        });
    });
</script>
