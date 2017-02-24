(function ($) {
    var Enterprise_Opinion = {
        init: function () {
            this.initEvents();
        },
        initEvents: function () {
            // 提交
            $("#submit_opinion").on("click", function (e) {
                e.preventDefault();

                var $form = $("#form_opinion");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting") {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('enterprise/saveOpinion', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        alert('信息已经提交成功，等待客户联系！');
                    } else {
                        console.log(res.message || '信息提交失败，请确认信息录入的正确性。');
                        alert('信息提交失败，请确认信息录入的正确性。');
                    }
                });
            });
        }
    };

    Enterprise_Opinion.init();
})(jQuery);
