(function () {
  'use strict';

  angular.module('ContactApp').controller('ContactsController', ContactsController);

  ContactsController.$inject = ['$scope', '$http', 'AuthService', '$location', '$resource'];
  function ContactsController($scope, $http, AuthService, $location, $resource) {
    $scope.load = function(){
      $http.get('/contacts').
        success(function (response) {
          console.log(response)
          $scope.contacts = response.data;
        })
        .error(function (data) {
          console.log(data);
      });
    }

    $scope.load()
  }
})();
