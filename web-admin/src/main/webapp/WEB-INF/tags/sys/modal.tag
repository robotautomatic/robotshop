<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="title" type="java.lang.String" required="false" description="模态框的标题" %>
<%@ attribute name="message" type="java.lang.String" required="false" description="模态框的消息" %>

<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">${title == null ? "温馨提示" : title}</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">
                <p id="modal-message">${message}</p>
            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button id="btnModalOk" type="button" class="btn btn-primary">确定</button>
            </div>

        </div>
    </div>
</div>