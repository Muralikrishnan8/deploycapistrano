angular.module('ContactApp')
.service('AuthService', function($q, $http, $location) {
  var CONTACT_API_TOKEN;

  var login = function(email, password) {
    window.localStorage.removeItem(CONTACT_API_TOKEN);
    $http.post('/users/sign_in', { 'user':{ 'email': email,'password': password }}).
      success(function (response) {
        if(response.status == "success"){
          storeUserCredentials(response.data.api_key);
          $location.path('/')
        } else{
          console.log("Invalid login");
        }
      })
      .error(function (data) {
        destroyUserCredentials();
    });
  };

  function storeUserCredentials(api_key) {
    $http.defaults.headers.common['api_key'] = api_key;
    window.localStorage.setItem(CONTACT_API_TOKEN, api_key);
    return true;
  }

  var logout = function() {
    destroyUserCredentials();
  };

  function destroyUserCredentials() {
    $http.defaults.headers.common['api_key'] = undefined;
    window.localStorage.removeItem(CONTACT_API_TOKEN);
  }

  function isAuthenticated() {
    var api_key = window.localStorage.getItem(CONTACT_API_TOKEN);
    return (api_key ? true : false)
  }

  function notAuthenticated() {
    return !isAuthenticated()
  }

  return {
    login: login,
    logout: logout,
    isAuthenticated: isAuthenticated(),
    notAuthenticated: notAuthenticated()
  };

})