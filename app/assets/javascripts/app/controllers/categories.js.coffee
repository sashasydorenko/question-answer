ctrl = angular.module 'categoriesController', []

ctrl.controller 'CategoriesCtrl', ['$scope', '$state', 'Categories', ($scope, $state, Categories) ->
  $scope.categories = Categories.all()
  
  $scope.activeCategory = (id) ->
    id is parseInt $state.params.category_id, 10
]
