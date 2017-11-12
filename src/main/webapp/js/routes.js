const routes = ($stateProvider, $urlRouterProvider) => {
    
      $urlRouterProvider.otherwise("/")
    
      $stateProvider
    
        .state('articulos', {
          url: "/articulos",
          templateUrl: "articulos.html",
          controller: "BBDDController as bbddController"
        })
    }
    