//// edit page
var editApp = angular.module('todoAppEdit', []);


editApp.directive('radioButtonGroup', function () {
    return {
        restrict: 'E',
        scope: {model: '=', options: '=', id: '=', name: '=', suffix: '='},
        controller: function ($scope) {
            $scope.activate = function (option, $event) {
                $scope.model = option[$scope.id];
                // stop the click event to avoid that Bootstrap toggles the "active" class
                if ($event.stopPropagation) {
                    $event.stopPropagation();
                }
                if ($event.preventDefault) {
                    $event.preventDefault();
                }
                $event.cancelBubble = true;
                $event.returnValue = false;

                document.getElementById('status').value = option[$scope.id];
                document.getElementById('deleteInDB').style.display = (option[$scope.id] == 'remove') ? 'block' : 'none';
            };

            $scope.isActive = function (option) {
                return option[$scope.id] == $scope.model;
            };

            $scope.getName = function (option) {
                return option[$scope.name];
            }

            $scope.getSuffix = function (option) {
                return option[$scope.suffix];
            }
        },
        template: "<button type='button' class='btn' ng-class='{true:\"btn-{{getSuffix(option)}}\", false:\"btn-default\"}[isActive(option)]' " +
        "ng-class='{active: isActive(option)}'" +
        "ng-repeat='option in options' " +
        "ng-click='activate(option, $event)'>{{getName(option)}} " +
        "</button>"
    };
});

editApp.controller('statusCtrl', function ($scope) {
    $scope.myOptions = [{id: "tasks", name: "В работе", suff: "info"},
        {id: "ok", name: "Выполнено", suff: "success"},
        {id: "remove", name: "Удалено", suff: "danger"}];
    $scope.myModel = document.getElementById('status').value;

    $scope.idProperty = "id";
    $scope.nameProperty = "name";
    $scope.bootstrapSuffix = "suff";

});