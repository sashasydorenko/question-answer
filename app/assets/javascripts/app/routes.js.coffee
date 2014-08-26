routes = angular.module 'routes', []

routes.config ['$locationProvider', '$stateProvider', '$urlRouterProvider', ($locationProvider, $stateProvider, $urlRouterProvider) ->
  $locationProvider.html5Mode true

  $urlRouterProvider.otherwise '/'

  $stateProvider
    .state 'main',
      url: '/'
      templateUrl: '/assets/app/templates/main.tpl.html'
      controller: 'MainCtrl'

    .state 'categories',
      url: '/categories'
      templateUrl: '/assets/app/templates/categories/list.tpl.html'
      controller: 'CategoriesCtrl'

    .state 'categories.questions',
      url: '/{category_id:[0-9]{1,9}}/questions'
      templateUrl: '/assets/app/templates/questions/list.tpl.html'
      controller: 'QuestionsCtrl'

    .state 'categories.questions.details',
      url: '/{question_id:[0-9]{1,9}}'
      controller: 'QuestionCtrl'
]
