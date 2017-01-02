(function () {
  'use strict';

  angular
    .module('ContactApp', ['ngResource', 'ngRoute'])
    .config(config);

  config.$inject = ['$routeProvider', '$locationProvider'];
  function config($routeProvider, $locationProvider) {
    $routeProvider
      .when('/', {
        controller: 'contactsController',
        templateUrl: 'templates/home/home.html'
      })

  }

})();