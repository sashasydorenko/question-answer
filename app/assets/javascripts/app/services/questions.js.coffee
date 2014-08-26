srv = angular.module 'questionsServices', []

srv.factory 'Questions', ['$resource', ($resource) ->
  Questions = -> 
    @service = $resource '/api/categories/:category_id/questions/:question_id/:status', category_id: '@category_id', question_id: '@question_id', status: '@status',
      update: method: 'PUT'
    return

  Questions::all = (category_id) ->
    @service.query category_id: category_id

  Questions::index = (category_id, question_id) ->
    @service.get category_id: category_id, question_id: question_id

  Questions::status = (category_id, question_id, attr) ->
    @service.update category_id: category_id, question_id: question_id, status: 'status', attr

  new Questions
]
