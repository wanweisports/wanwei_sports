!(function (doc) {
    // html root的字体计算
    // 之所以要加个判断返回一个20.5，是因为当用户在谷歌等浏览器直接输入手机端网站网址时
    var clientWidth = doc.documentElement ? doc.documentElement.clientWidth : doc.body.clientWidth;

    if (clientWidth > 768) {
        clientWidth = 768;
    }

    doc.documentElement.style.fontSize = clientWidth / 16 + "px";
})(document);
