<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>TODO application example</title>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.6.0.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/core/css/todo.css">

    <spring:url value="/resources/core/js/todoedit.js" var="todoJS"/>
    <script type="text/javascript" src="${todoJS}"></script>
</head>

<body ng-app="todoAppEdit">

<spring:url value="/" var="urlHome"/>
<spring:url value="/todo/add" var="urlAddTodo"/>
<nav class="navbar navbar-inverse ">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="${urlHome}">Список задач</a>
        </div>
    </div>
</nav>
<div class="container">
    <c:choose>
        <c:when test="${todoForm['new']}">
            <h3>Новая задача</h3>
        </c:when>
        <c:otherwise>
            <h3>Редактирование задачи</h3>
        </c:otherwise>
    </c:choose>
    <br/>
    <div>

        <form:form class="form-horizontal" method="post" modelAttribute="todoForm" action="/todo" acceptCharset="UTF-8">

            <form:hidden path="id" id="id"/>

            <spring:bind path="todoText">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <label class="col-sm-2 control-label">Текст задачи</label>

                    <div class="col-sm-10">
                        <form:textarea path="todoText" class="form-control " id="todoText"
                                       placeholder="Введите новый текст"/>
                        <form:errors path="todoText" class="control-label"/>
                    </div>
                </div>
            </spring:bind>

            <spring:bind path="fire">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <label class="col-sm-2 control-label">Важная задача </label>

                    <div class="col-sm-10">
                        <form:checkbox path="fire" id="important"/>
                        <form:errors path="fire" class="control-label"/>

                    </div>
                </div>
            </spring:bind>

            <spring:bind path="status">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <label class="col-sm-2 control-label">Статус задачи</label>

                    <div ng-controller="statusCtrl" class="radiogroup col-sm-10">
                        <form:input path="status" type="hidden" id="status"/>
                        <radio-button-group class="btn-group" data-toggle="buttons-radio" model="myModel"
                                            options="myOptions" id="idProperty" name="nameProperty"
                                            suffix="bootstrapSuffix"></radio-button-group>
                    </div>
                </div>
            </spring:bind>
            <div class="form-group" id="deleteInDB" style="display:
            <c:choose>
            <c:when test="${todoForm.status=='remove'}">block</c:when>
            <c:otherwise>none</c:otherwise>
            </c:choose>;">
                <label class="col-sm-2 control-label">Удалить из базы </label>

                <div class="col-sm-10">
                    <form:checkbox path="removeFromDB"/>
                </div>
            </div>


            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input class="btn btn-default" type="button" onclick="history.back(); return false;"
                           value="Отмена"/>
                    <input class="btn btn-primary" type="submit" value="Сохранить"/>
                </div>
            </div>

        </form:form>

    </div>


    <hr>
    <footer>
        <p>&copy; SergeiRodionov.ru 2015</p>
    </footer>
</div>

</body>
</html>