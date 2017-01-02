(function () {
  'use strict';

  angular
    .module('ContactApp', ['ngResource', 'ngRoute'])
    .config(config)
    .run(run);

  config.$inject = ['$routeProvider', '$locationProvider'];
  function config($routeProvider, $locationProvider) {
    $routeProvider
      .when('/', {
        controller: 'ContactsController',
        templateUrl: 'templates/home/home.html'
      })
      .when('/login', {
        controller: 'LoginController',
        templateUrl: 'templates/login/login.html'
      })
      .when('/register', {
        controller: 'RegisterController',
        templateUrl: 'templates/register/register.html'
      })
      .otherwise({ redirectTo: '/login' });
  }

  run.$inject = ['$rootScope', '$location', 'AuthService'];
  function run($rootScope, $location, AuthService) {
    if(AuthService.notAuthenticated)
    {
      $location.path('/login')
    }
  }

})();