<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="layout" uri="http://www.wanwei.com/tags/tag" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html style="font-size: 23.4375px;">
<head>
    <base href="<%= basePath %>">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">

    <title>${param.title == null ? "注册协议" : param.title}</title>

    <meta name="keywords"
          content="${param.keyword == null ? "万为培训, 约课系统, 体育培训, 培训，万为, wanwei.com" : param.keyword}">
    <meta name="description"
          content="${param.desc == null ? "万为培训 - 提供智能化的培训管理服务平台。" : param.desc}">
    <meta name="author" content="北体高科（北京）科技有限公司">

    <meta name="renderer" content="webkit">
    <meta name="layoutmode" content="standard">
    <meta name="format-detection" content="telephone=no,address=no,email=no">
    <meta name="mobileOptimized" content="width">
    <meta name="handheldFriendly" content="true">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!--uc浏览器判断到页面上文字居多时，会自动放大字体优化移动用户体验。添加以下头部可以禁用掉该优化-->
    <meta name="wap-font-scale" content="no">

    <meta name="flexible" content="initial-dpr=1">
    <link href="Content/favicon.ico?v=${static_resource_version}" rel="shortcut icon" type="image/x-icon"/>

    <script type="text/javascript">
        // html root的字体计算应该放在最前面，这样计算就不会有误差了
        // 之所以要加个判断返回一个20.5，是因为当用户在谷歌等浏览器直接输入手机端网站网址时，
        // 如果用户设置模块自定义样式的高度比较小，由于这时候的clientWidth为1920px，
        // 及返回的_htmlFontSize为40，这时候就会使模块太小，展示不完全，
        // 因此先取一个较为准确的值去展示。Mobi.resetHtmlFontSize()顺便也加了
        var _htmlFontSize = (function () {
            var clientWidth = document.documentElement ? document.documentElement.clientWidth : document.body.clientWidth;
            if (clientWidth > 768) clientWidth = 768;
            document.documentElement.style.fontSize = clientWidth / 16 + "px";
            return clientWidth / 16;
        })();
    </script>

    <link rel="stylesheet" type="text/css"
          href="Content/style/training/student/fontsIco.min.css?v=${static_resource_version}">
    <link rel="stylesheet" type="text/css"
          href="Content/style/training/student/base.min.css?v=${static_resource_version}">
    <link rel="stylesheet" type="text/css"
          href="Content/style/training/student/1003_1.min.css?v=${static_resource_version}">
</head>

<body id="g_body" class="g_locale2052 mobiCol3">

<div class="webLeft"></div>

<div id="g_web" class="g_web">
    <!-- this is loading  -->
    <div id="webLoading" class="loading" style="display:none;">
        <div id="splashscreen" class="splashscreen ui-loader">
            <span class="ui-icon ui-icon-loading spin"></span>
        </div>
    </div>

    <div id="webContainerBox" class="webContainerBox moveAnimation">
        <div id="webModuleContainer" class="webModuleContainer" style="overflow: hidden;">
            <div id="module310" class="form Handle  formStyle2 ">
                <div class="formMiddle formMiddle310">
                    <div class="middleLeft middleLeft310"></div>
                    <div class="middleCenter middleCenter310">
                        <div class="formMiddleContent formMiddleContent310 moduleContent">
                            <div class="J_richContentPanel310 f-contentPanel">
                                <div class="formBannerTitle formBannerTitle310" style="height: 2rem;">
                                    <div class="titleLeft titleLeft310"></div>
                                    <div class="titleCenter titleCenter310">
                                        <div class="titleText titleText310">
                                            <div class="titleTextIcon icon-titleText">&nbsp;</div>
                                            <div class="textContent">万为培训用户注册协议</div>
                                        </div>
                                        <div class="formBannerMore formBannerMore310"></div>
                                    </div>
                                    <div class="titleRight titleRight310"></div>
                                </div>
                                <div class="richContent richContent3 richContent310">
                                    <div class="protocol" style="font-size: 0.7rem; color: #333;">
                                        重要须知：<br>
                                        本协议是您（用户，包括自然人、法人）与北体高科（北京）科技有限公司之间就万为培训软件注册及服务相关事宜所订立的契约，适用于您在读秒注册及使用读秒服务的全部行为。<br>
                                        <strong><u>在注册成为读秒用户前，请您务必认真、仔细阅读并充分理解本协议全部内容，特别是其中所涉及的对读秒的责任免除及对您的权利限制的条款。您在读秒提供的网络页面上点击以合理的理解表明您希望与本公司签订本协议的按钮（例如，按钮上书写</u></strong><strong><u>“</u></strong><strong><u>同意协议并注册</u></strong><strong><u>”</u></strong><strong><u>或类似文字，且页面上同时列明了本协议的内容或者可以有效展示本协议内容的链接），即表示您在充分阅读并理解本协议的内容基础上确认接受并签署本协议，同时表示您与读秒已达成协议并同意接受本协议的全部约定内容，包括与本协议有关的各项规则及读秒网络页面所包含的已经发布的或者将来发布的各类声明、规则、说明等（若服务协议中没有约定的以读秒网络页面发布的各类声明、规则、说明等中对应内容为准）。</u></strong>如您不同意或者不接受本协议的全部或者部分内容，请您不要注册成为读秒用户及使用读秒服务。<br>
                                        一． 读秒的账户及服务<br>
                                        1.读秒是一款智能信贷决策引擎，其运用大数据风控和独创的精准决策运营模型进行信贷决策，可以提供以多种形式驱动的纯线上无抵押无担保贷款的服务（具体以读秒及相关交易网站实时展示为准）。<br>
                                        2.读秒采用实名制注册，用户应如实填写和提交账号注册和认证资料，并对资料的真实性、合法性、准确性和有效性承担责任。<br>
                                        3.用户注册成功后，读秒将给予每个用户一个用户账号及相应的密码（“读秒账户”），该用户账号和密码由用户负责保管；用户应当对以其用户账号进行的所有活动和事件负法律责任。<br>
                                        <strong>4.</strong><strong><u>为确保交易安全，用户同意使用专业服务机构提供的数字证书完成交易文件签署及交易行为确认，用户知悉并授权读秒将用户相关信息提交至服务机构代为申请专属于用户的数字证书，该数字证书将会被作为完成用户在读秒在线签署电子合同等法律文本之目的使用。</u></strong><strong><u></u></strong><br>
                                        5.除非另有其它明示规定，读秒所展示的新产品、新功能、新服务，均受到本协议之规范。<br>
                                        6.读秒仅作为网络环境下用户或者关联网站发布信息的场所，鉴于网络服务的特殊性，用户同意读秒有权不经事先通知，随时变更、中断或终止部分或全部的网络服务。<br>
                                        7.读秒需要定期或不定期地进行维护，如因此类情况而造成网络服务在合理时间内的中断，读秒无需为此承担任何责任。读秒保留不经事先通知为维护、升级或其它目的暂停本服务任何部分的权利。<br>
                                        8.读秒有权于任何时间暂时或永久修改或终止服务（或其任何部分），而无论其通知与否，读秒对用户和任何第三人均无需承担任何责任。<br>
                                        <strong>9.</strong><strong><u>用户确认知悉，读秒的账户仅供读秒提供相关借贷服务及交易环境，基于交易行为发生的相关的资金管理及划付服务均由具有法定资质的第三方机构提供，读秒对用户以完成交易为目的的资金管理及划付的指令及最终的结果、时效性不承担任何责任。针对冒用他人账户的行为，读秒保留对实际使用人追究责任的权利。</u></strong><strong><u></u></strong><br>
                                        10.读秒账户的所有权归读秒所有，用户完成注册申请手续后，获得读秒账户的使用权。用户同意读秒基于自行之考虑，有权对符合以下条件的读秒账户做回收处理，回收处理情形下读秒的服务相应终止，且读秒有权立即关闭或删除用户读秒账户及其中所有相关信息及文件：<br>
                                        o（1）未绑定通过实名认证的各平台账户；<br>
                                        o（2）连续12个月未用于登录；<br>
                                        o（3）不存在未到期的有效业务超过12个月；或<br>
                                        o（4）读秒有合理理由认为用户的行为已经违反本协议的文字及精神及公平正义、公序良俗等社会公益价值。<br>
                                        二． 读秒服务内容<br>
                                        <strong>1.</strong><strong><u>读秒只接受持有中华人民共和国有效身份证的</u></strong><strong><u>18</u></strong><strong><u>周岁以上的具有完全民事行为能力的自然人或者依据中华人民共和国法律依法设立并存续的法人成为网站用户，如用户不符合资格，请勿继续操作注册。读秒保留因用户注册信息不实而随时中止或终止用户资格的权利，包括但不限于对用户读秒账号进行回收、封号等操作，由此所产生的损失由用户自行承担，读秒将不承担任何责任。</u></strong><strong><u></u></strong><br>
                                        <strong>2.</strong><strong><u>用户在注册读秒及使用相关服务时应当根据读秒的要求提供自己的个人资料，并在使用过程中依据读秒的要求更新上述个人资料并保证此等资料完整、有效。如因注册信息不真实或更新不及时而引起的问题，读秒不负任何责任。如发现用户以虚假信息注册而骗取读秒账号使用权，或注册信息存在违法和不良信息的，读秒有权单方采取限期改正、暂停使用、注销登记、收回等措施，且上述措施的采用不以通知为必要条件。</u></strong><strong><u></u></strong><br>
                                        3.用户成功注册为读秒用户后，应当妥善保管自己的用户名和密码，不得将账号、密码进行转让、出售、出借、出租、赠与或授权给第三方使用，若用户授权他人使用其账户应对被授权人在该账户下发生的所有行为负全部责任。因密码被遗忘、被第三方破解，使用的计算机被入侵等原因造成的交易风险均亦由用户自行承担。<strong><u>用户在此确认以其用户名和密码登录读秒情形下，经由用户的读秒账户发出的一切指令均视为用户本人的行为和真实意思表示，该等指令不可撤销，由此产生的一切责任和后果由用户本人承担。</u></strong><br>
                                        4.用户不得利用读秒从事任何违法违规活动，用户在此承诺合法使用读秒提供的服务，遵守中国现行法律、法规、规章、规范性文件的规定以及读秒的规则、协议等规范。若用户违反上述规定，所产生的一切法律责任和后果由用户自行承担。用户承担法律责任的形式包括但不限于：对受到侵害者进行赔偿，以及如读秒首先承担了因用户行为导致的行政处罚或侵权损害赔偿责任后，用户应向读秒进行赔偿。如因此给读秒造成损失的，由用户赔偿读秒的损失。读秒保留将用户违法违规行为及有关信息资料进行公示、计入用户信用档案、按照法律法规的规定提供给有关政府部门或按照有关协议约定提供给第三方的权利。<br>
                                        5.如用户在读秒的某些行为或言论不合法、违反有关协议约定、侵犯读秒利益等，读秒有权基于独立判断直接删除用户在读秒上作出的上述行为或言论，有权中止、终止、限制用户使用读秒服务，而无需通知用户，亦无需承担任何责任。<br>
                                        三． 不保证条款<br>
                                        <strong>1.</strong><strong><u>读秒提供的信息和服务中不含有任何明示、暗示的，对任何用户、任何交易的真实性、准确性、可靠性、有效性、完整性等的任何保证和承诺，用户需根据自身风险承受能力，衡量读秒披露的内容的真实性、可靠性、有效性、完整性，用户因其选择使用读秒提供的服务、参与的交易等而产生的直接或间接损失均由用户自己承担，包括但不限于资金损失、利润损失、营业中断等。</u></strong><strong><u></u></strong><br>
                                        <strong>2.</strong><strong><u>基于互联网的特殊性，无法保证读秒的服务不会中断，对于包括但不限于设备、系统存在缺陷，遭到病毒、黑客攻击或者发生地震、海啸等不可抗力而造成服务中断或因此给用户造成的损失，由用户自己承担。</u></strong><strong><u></u></strong><br>
                                        四． 隐私保护<br>
                                        <strong>1.</strong><strong><u>读秒有义务就用户提供的及自行合法收集的用户信息采用合理的、必要的手段及措施进行保护，以更充分的了解用户需求、协助用户完成交易。</u></strong><strong><u></u></strong><br>
                                        2.您在此特别授权读秒，有权利就您提供的及自行合法收集的用户信息进行合法的使用（包括以不伤害用户隐私权为前提的商业上的使用），且在如下情况或为如下目的，读秒可能会在第三方承担保密义务的情况下，向不特定第三方披露您的信息：<br>
                                        o（1）事先获得用户的授权；<br>
                                        o（2）用户使用共享功能；<br>
                                        o（3）根据法律、法规、法律程序的要求或政府主管部门的强制性要求；<br>
                                        o（4）以学术研究或公共利益为目的；<br>
                                        o（5）为维护读秒的合法权益，例如查找、预防、处理欺诈或安全方面的问题；<br>
                                        o（6）为维护读秒其他用户的合法权益，即在用户违反读秒规则及交易协议约定情形下，读秒有权将用户的信息进行黑名单披露并共享给与读秒有合作关系的第三方；<br>
                                        o（7）为与您进行电话联系，或在您的借款申请被读秒拒绝后，由在“信贷动力”注册的信贷员联系您，为您提供进一步贷款咨询服务。<br>
                                        o（8）符合相关服务条款或使用协议的规定。<br>
                                        <strong>3.</strong><strong><u>读秒采用行业标准惯例以保护用户的个人或法人信息和资料，鉴于技术限制，不能确保用户的全部私人通讯及其他个人或法人资料不会通过不明的途径泄露出去。</u></strong><strong><u></u></strong><br>
                                        4.针对本条款约定情形下的信息使用及披露有可能给用户造成的损失，读秒不承担任何责任。<br>
                                        五． 使用规则<br>
                                        1.用户在使用读秒App服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为:<br>
                                        （1）上载、展示、张贴、传播或以其它方式传送含有下列内容之一的信息：<br>
                                        &nbsp;&nbsp;o&nbsp;1）反对宪法所确定的基本原则的；<br>
                                        &nbsp;&nbsp;o&nbsp;2）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br>
                                        &nbsp;&nbsp;o&nbsp;3）损害国家荣誉和利益的；<br>
                                        &nbsp;&nbsp;o&nbsp;4）煽动民族仇恨、民族歧视、破坏民族团结的；<br>
                                        &nbsp;&nbsp;o&nbsp;5）破坏国家宗教政策，宣扬邪教和封建迷信的；<br>
                                        &nbsp;&nbsp;o&nbsp;6）散布谣言，扰乱社会秩序，破坏社会稳定的；<br>
                                        &nbsp;&nbsp;o&nbsp;7）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br>
                                        &nbsp;&nbsp;o&nbsp;8）侮辱或者诽谤他人，侵害他人合法权利的；<br>
                                        &nbsp;&nbsp;o&nbsp;9）含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容；<br>
                                        &nbsp;&nbsp;o&nbsp;10）含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的。<br>
                                        （2）不得为任何非法目的而使用读秒服务系统。<br>
                                        2.用户违反本协议或相关的服务条款的规定，导致或产生的任何第三方向读秒主张的任何索赔、要求或损失（包括合理的律师费），将由用户向读秒进行赔偿，以使之免受损害。对此，读秒有权视用户行为的性质，采取包括但不限于删除用户发布信息内容、暂停使用许可、终止服务、限制使用、回收读秒账号、追究法律责任等措施。对恶意注册读秒账号或利用读秒账号进行违法活动，骚扰、欺骗其他用户，以及其他违反法律规定及违反本协议的行为，读秒有权回收其读秒账号。同时，读秒公司会视司法部门的要求，协助调查。<br>
                                        3.用户不得对本协议及本服务的任何部分或基于本协议或本服务之使用或获得的信息，进行出售、转售或用于任何其它商业目的。<br>
                                        <strong>4.</strong><strong><u>用户同意：读秒为更加有效、及时的向用户提供服务将通过</u></strong><strong><u>APP</u></strong><strong><u>推送、手机短信、电子邮件等形式向用户发布读秒相关信息，包括但不限于项目信息、账户资金变动信息等。</u></strong><strong><u></u></strong><br>
                                        六． 知识产权<br>
                                        1.读秒内容受中国知识产权法律法规及各国际版权公约的保护。用户承诺不以任何形式复制、模仿、传播、出版、公布、展示读秒内容，包括但不限于电子的、机械的、复印的、录音录像的方式和形式等。<br>
                                        2.用户未经授权不得将读秒包含的资料等任何内容发布到任何其他网站或者服务器。任何未经授权对读秒内容的使用均属于违法行为。<br>
                                        3.用户保证，其发布在读秒上的任何信息和内容都没有侵犯任何第三方的知识产权，也不存在可能导致侵犯第三方知识产权的情形。若任何第三方因用户发布的信息和内容提出权属异议或引起任何纠纷，用户自行承担责任，与读秒无关。<br>
                                        4.用户同意，其发布上传到读秒上可公开获取区域的任何内容，用户同意读秒有权将内容用于其他合法用途，包括但不限于部分或者全部地复制、修改、改编、翻译、组装、分拆、推广、分发、广播、表演、演绎、出版。<br>
                                        七． 法律适用和争议解决<br>
                                        本协议的签订、效力、履行、终止、解释和争端解决适用中国法律法规。如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向读秒所在地的人民法院提起诉讼。<br>
                                        八． 其他<br>
                                        1.本协议自用户签署并成功注册为读秒用户之日起生效，除非读秒终止本协议或者用户丧失读秒用户资格，否则本协议始终有效。<strong><u>出于运行和交易安全的需要，读秒可以暂时停止提供或者限制本服务部分功能，或提供新的功能，在任何功能减少、增加或者变化时，只要用户仍然使用读秒服务，表示用户仍然同意本协议或者变更后的协议。</u></strong><br>
                                        <strong>2.</strong><strong><u>本协议终止并不免除用户根据本协议或其他有关协议、规则已经发生的行为或达成的交易项下所应承担的义务和责任。</u></strong><strong><u></u></strong><br>
                                        3.读秒未行使或执行本服务协议任何权利或规定，不构成对前述权利之放弃。<br>
                                        4.如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。<br>
                                        5.读秒对本协议享有最终的解释权。<br></div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                    <div class="middleRight middleRight310"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="webRight"></div>

</body>
</html>
