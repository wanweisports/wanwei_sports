/**
 * 统一校验
 */
(function (Vue, $) {
    Vue.Errors = {
        phone: "请输入合法的手机号",
        password: "密码只能为6-32位数字，字母及常用符号组成",
        realName: "姓名必须是汉字且长度不超过5个",
        identifyNumber: "身份证号码错误",
        bankCard: "银行卡号码错误",
        code: "请输入验证码"
    };

    // 校验不为空
    Vue.validator('notNull', function (val) {
        return !!val;
    });

    // 校验手机号码
    Vue.validator('phone', function (val) {
        return /^1\d{10}$/.test(val);
    });

    // 校验密码
    Vue.validator('password', function (val) {
        return /^[A-Za-z0-9\^$\.\+\*_@!#%&~=-]{6,32}$/.test(val);
    });

    // 校验18位身份证
    Vue.validator('identifyNumber', function (val) {
        return /^\d{18}$|^\d{17}(\d|X|x)$/.test(val);
    });

    // 校验1~5位中文名字
    Vue.validator('chineseName', function (val) {
        return /^[\u4e00-\u9fa5]{1,5}$/.test(val);
    });

    // 校验银行卡号
    Vue.validator('bankCard', function (val) {
        val = val.replace(/\s/g, "");
        return /^\d{13,19}$/.test(val);
    });

})(Vue, Zepto);