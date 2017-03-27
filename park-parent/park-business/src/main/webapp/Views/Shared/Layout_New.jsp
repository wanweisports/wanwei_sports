<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="layout" uri="http://www.wanwei.com/tags/tag"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <base href="<%= basePath %>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>${param.title == null || param.title eq "" ? "万维体育 wanwei.com - 智能场馆管理系统" : param.title}</title>

    <meta name="keywords" content="${param.keyword == null || param.keyword eq "" ? "万维体育, 智能体育场馆, 体育场馆, 预订, 收银, 万维, wanwei.com" : param.keyword}"/>
    <meta name="description" content="${param.desc == null || param.desc eq "" ? "万维体育 wanwei.com - 提供智能化的体育场馆运营服务。" : param.desc}"/>
    <meta name="author" content="北体高科技术有限公司" />

    <meta name="renderer" content="webkit|ie-comp|ie-stand">

    <link href="Content/favicon.ico?v=${static_resource_version}" rel="shortcut icon" type="image/x-icon" />
    <link href="Content/lib/bootstrap/bootstrap.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/style/base_new.css?v=${static_resource_version}" rel="stylesheet" type="text/css">

    <layout:block name="<%=Blocks.BLOCK_HEADER_CSS%>"/>

    <script src="Content/lib/html5shiv/html5.min.js?v=${static_resource_version}"></script>
</head>
<body>
    <%@ include file="../Shared/Top_New.jsp"%>

    <div class="container-wrapper">
        <table class="wrapper">
            <tr>
                <td class="wrapper-td">
                    <table style="table-layout: fixed; width: 100%; height: 100%; border: 0;">
                        <tr>
                            <td nowrap style="width: 162px; vertical-align: top; text-align: center;">
                                <%@ include file="../Shared/Left_New.jsp"%>
                            </td>
                            <td style="width: 2px; background: #004C7E; vertical-align: middle;">&nbsp;</td>
                            <!--<td style="width: 2px;">&nbsp;</td>-->
                            <td style="text-align: center; vertical-align: top;">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <table style="margin-top: 0; width: 100%; height: 100%;">
                                                <tr>
                                                    <td style="vertical-align: top;">
                                                        <table style="background: url('Content/images/new/right_table_bg.jpg?v=${static_resource_version}') repeat-x; height:26px; border-bottom:1px solid #5BA8DE; width: 100%;">
                                                            <tr>
                                                                <td style="text-align: left; color: #004C7E; padding-left: 12px;">
                                                                    <a href="javascript:history.go(-1);" class="btn btn-primary"
                                                                        style="padding: 2px 12px; margin-right: 2px; opacity: 0.6;">
                                                                        <span class="glyphicon glyphicon-arrow-left"></span>
                                                                    </a>
                                                                    <layout:block name="<%=Blocks.BLOCK_NAV_PATH%>"/>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><layout:block name="<%=Blocks.BLOCK_BODY%>"/></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>

    <div class="modal fade" id="tips_failure_modal" tabindex="-1" role="dialog" aria-labelledby="tips_failure_modal_label">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tips_failure_modal_label">警告提示</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger tips-content" role="alert"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 我知道了
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tips_success_modal" tabindex="-1" role="dialog" aria-labelledby="tips_success_modal_label">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tips_success_modal_label">成功提示</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success tips-content" role="alert"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 我知道了
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tips_confirm_modal" tabindex="-1" role="dialog" aria-labelledby="tips_confirm_modal_label" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tips_confirm_modal_label">确认提示</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-warning tips-content" role="alert"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script src="Content/lib/jquery/jquery-1.12.3.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/bootstrap/bootstrap.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/moment/moment.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.cookie/jquery.cookie-1.4.1.min.js?v=${static_resource_version}"></script>
    <script src="Content/app/common/text_magnifier.js?v=${static_resource_version}"></script>
    <script src="Content/app/common/base_new.js?v=${static_resource_version}"></script>

    <layout:block name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>"/>
    <layout:block name="<%=Blocks.BLOCK_TRACE_SCRIPTS%>"/>
</body>
</html>
