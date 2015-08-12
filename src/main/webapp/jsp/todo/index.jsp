<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <spring:url value="/resources/core/js/todo.js" var="todoJS"/>
    <script type="text/javascript" src="${todoJS}"></script>
</head>

<body class="page-body">

<spring:url value="/" var="urlHome"/>
<spring:url value="/todo/add" var="urlAddTodo"/>
<nav class="navbar navbar-inverse ">
    <div class="container">


        <div class="navbar-header">
            <a class="navbar-brand" href="${urlHome}">Список задач</a>
        </div>
        <div id="navbar">
            <ul class="nav navbar-nav navbar-right">
                <li class="active">
                </li>
                <li class="active"><a href="${urlAddTodo}">Добавить</a></li>
            </ul>
        </div>

    </div>
</nav>
<div class="container">
    <c:if test="${not empty msg}">
        <div class="alert alert-${css} alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"
                    onclick="this.parentNode.style.display='none';">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>${msg}</strong>
        </div>
    </c:if>


    <div ng-app="todoApp" ng-controller="todoCtrl">
        <form class="form-inline">
            <div id="selectStatus" class="form-group">
                <label for="filterSelect">Фильтр задач: </label>
                <select ng-model="filterSelect" id="filterSelect" class="form-control">
                    <option value="" selected="selected">Все</option>
                    <option value="tasks">В работе</option>
                    <option value="ok">Выполнена</option>
                    <option value="remove">Удалена</option>
                </select>
            </div>
            <div id="selectRowPerPage" class="form-group">
                <label for="filterRowPerPage">Выводить по: </label>
                <select data-ng-model="filterRow" id="filterRowPerPage" class="form-control"
                        ng-change="changeFilterRow(filterRow)"
                        data-ng-options="id as label for (label, id) in listPageRows">

                </select>
            </div>
            <div class="form-group">
                <label for="searchTodo">Содержит текст: </label>
                <input type="text" ng-model="searchTodo" class="form-control" placeholder="минимум 3 символа"
                       id="searchTodo">
            </div>


        </form>
        <hr/>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>&nbsp;</th>
                <th>&nbsp;</th>
                <th>Задачи/дела</th>
                <th>Операции</th>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="todo in items | startFrom: startingItem() | limitTo: itemsPerPage">
                <td width="10"><span class="glyphicon"
                                     ng-class="{true:'glyphicon-fire fire'}[todo.fire]"></span>&nbsp;</td>
                <td width="10"><span class="glyphicon glyphicon-{{ todo.status }}"
                                     ng-class="{ok:'complete'}[todo.status]"></span>&nbsp;</td>
                <td width="90%" ng-class="{remove:'removed',ok:'complete'}[todo.status]">{{ todo.todoText }}</td>
                <td>
                    <button class="btn" ng-click="editTodo(todo.id)">
                        <span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;Редактировать
                    </button>

                </td>
            </tr>


            </tbody>
        </table>

        <div id="pagination">
            <button class="btn btn-primary btn-sm" ng-disabled="firstPage()" ng-click="pageBack()">Назад</button>
            &nbsp;<span>{{currentPage+1}} из {{numberOfPages()}}</span>&nbsp;
            <button class="btn btn-primary btn-sm" ng-disabled="lastPage()" ng-click="pageForward()">Вперед</button>
        </div>

    </div>
    <hr>
    <footer>
        <p>&copy; SergeiRodionov.ru 2015</p>
    </footer>
</div>

</body>
</html>