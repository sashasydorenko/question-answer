srv = angular.module 'categoriesServices', []

srv.factory 'Categories', ['$resource', ($resource) ->
  Categories = -> 
    @service = $resource '/api/categories/:category_id', category_id: '@category_id',
      update: method: 'PUT'
    return

  Categories::all = ->
    @service.query()

  Categories::index = (category_id) ->
    @service.get category_id: category_id

  new Categories
]
