(function ($) {
    // 筛选会员类型
    $(".card-type-filter").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#card_filter_form").serialize();

        location.assign('/users/membersCategory?' + conditions);
    });

    var ajaxLock = false;
    $("#save_card_type").on("click", function (e) {
        e.preventDefault();

        var conditions = $("#card_type_form").serialize();

        if (ajaxLock) {
            return false;
        }
        ajaxLock = true;

        $.post('/users/submitMembersCategory', conditions, function (res) {
            if (res.status == 200) {
                location.reload();
            } else {
                alert("保存失败");
                ajaxLock = false;
            }
        });
    });

    function renderCardTypeData(data) {
        if (data.card_type_name) {
            $("#card_type_name").val(data.card_type_name);
        }
        if (data.card_type_month) {
            $("#card_type_month").val(data.card_type_month);
        }
        if (data.card_type_time_start) {
            $("#card_type_time_start").val(data.card_type_time_start);
        }
        if (data.card_type_time_end) {
            $("#card_type_time_end").val(data.card_type_time_end);
        }
        if (data.card_type_discount) {
            $("#card_type_discount").val(data.card_type_discount);
        }
        if (data.card_type_money) {
            $("#card_type_money").val(data.card_type_money);
        }
        if (data.card_type_overdraw) {
            $("#card_type_overdraw").val(data.card_type_overdraw);
        }
        if (data.card_payment_type) {
            $("#card_payment_type").val(data.card_payment_type);
        }

        if (data.card_type_status) {
            $("[name='card_type_status'][value='" + data.card_type_status + "']").prop("checked", true);
        }

    }

    // 卡类型详情
    $(".card-type-list").on("click", ".type-item", function (e) {
        e.preventDefault();

        var id = $(this).attr("data-id");

        $.post('/users/membersCategory/' + id, {}, function (res) {
            if (res.status == 200) {
                renderCardTypeData(res.data);
            } else {
                alert("查询失败");
                ajaxLock = false;
            }
        });
    });
})(jQuery);
