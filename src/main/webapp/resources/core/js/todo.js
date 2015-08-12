var app = angular.module('todoApp', ['ui.bootstrap']);


function todoCtrl($scope, $http, filterFilter) {
    $scope.currentPage = 0;
    $scope.itemsPerPage = 5;
    $scope.items = [];
    $scope.itemsAll = [];
    $scope.lastFilter = '';
    $scope.lastSearchText = '';


    $scope.listPageRows = {'5 строк': 5, '10 строк': 10};
    $scope.filterRow = $scope.itemsPerPage;

    // first load
    $http.get('/todo/list.json').
        success(function (data) {
            $scope.itemsAll = data;
            $scope.items = data;
        });

    $scope.updateList = function (searchText) {
        $http.get('/todo/list.json?t=' + searchText).
            success(function (data) {
                $scope.itemsAll = data;
                $scope.lastSearchText = searchText;
                $scope.items = filterFilter($scope.itemsAll, $scope.lastFilter);
                var newNumOfPages = Math.ceil($scope.items.length / $scope.itemsPerPage);

                if ($scope.currentPage > newNumOfPages) {
                    $scope.currentPage = newNumOfPages;
                }
            });
    };


    $scope.$watch('filterSelect', function (term) {
        // Create filter
        $scope.currentPage = 0;
        $scope.lastFilter = term;
        $scope.items = filterFilter($scope.itemsAll, term);
    });

    $scope.$watch('searchTodo', function (txt) {
        txt = typeof txt !== 'undefined' ? txt : "";
        if (txt.length > 2) {
            $scope.updateList(txt);
        }
    });


    $scope.changeFilterRow = function (term) {
        // Create filter
        $scope.currentPage = 0;
        $scope.itemsPerPage = term;
        $scope.items = filterFilter($scope.itemsAll, $scope.lastFilter);
    };


    $scope.firstPage = function () {
        return $scope.currentPage == 0;
    }
    $scope.lastPage = function () {

        var lastPageNum = Math.ceil($scope.items.length / $scope.itemsPerPage - 1);
        return $scope.currentPage >= lastPageNum;
    }
    $scope.numberOfPages = function () {
        return Math.ceil($scope.items.length / $scope.itemsPerPage);
    }
    $scope.startingItem = function () {
        return $scope.currentPage * $scope.itemsPerPage;
    }
    $scope.pageBack = function () {
        $scope.updateList($scope.lastSearchText);
        $scope.currentPage = $scope.currentPage - 1;
    }
    $scope.pageForward = function () {
        $scope.updateList($scope.lastSearchText);
        $scope.currentPage = $scope.currentPage + 1;
    }

    $scope.editTodo = function (todoId) {
        window.location.href = '/todo/' + todoId + '/edit/';
    }
};


app.filter('startFrom', function () {
    return function (input, start) {
        start = +start;
        return input.slice(start);
    }
});
app.controller('todoCtrl', todoCtrl);


