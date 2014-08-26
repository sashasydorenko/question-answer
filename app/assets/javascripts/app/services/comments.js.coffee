srv = angular.module 'commentsServices', []

srv.factory 'Comments', ['$resource', '$stateParams', ($resource, $stateParams) ->
  Comments = ->
    @service = $resource '/api/categories/:category_id/questions/:question_id/comments', category_id: '@category_id', question_id: '@question_id'
    return

  Comments::all = (category_id, question_id) ->
    @service.query category_id: category_id, question_id: question_id

  Comments::create = (category_id, question_id, attr) ->
    @service.save category_id: category_id, question_id: question_id, attr

  new Comments
]
