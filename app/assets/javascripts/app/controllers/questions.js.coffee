ctrl = angular.module 'questionsController', []

ctrl.controller 'QuestionsCtrl', ['$scope', '$state', '$modal', 'Questions', ($scope, $state, $modal, Questions) ->
  params = $state.params

  $scope.questions = Questions.all params.category_id

  modal = $modal
    animation: 'am-fade-and-scale'
    template: '/assets/app/templates/modals/confirm.tpl.html'
    backdrop: false
    placement: 'center'
    title: 'Are you sure?'
    content: 'Are you sure you want to change status of this question?'
    show: false

  $scope.changeStatus = (question) ->
    attr = status: question.status

    modal.show()

    modal.$scope.ok = ->
      modal.hide()
      Questions.status params.category_id, question.id, attr

    modal.$scope.no = ->
      modal.hide()

      switch question.status
        when 'open'
          question.status = 'ballot'
        when 'ballot'
          question.status = 'open'
        when 'close'
          question.status = 'ballot'
]

ctrl.controller 'QuestionCtrl', ['$scope', '$state', '$window', '$timeout', '$modal', 'Questions', 'Comments', ($scope, $state, $window, $timeout, $modal, Questions, Comments) ->
  params = $state.params

  $scope.questionLoader = true
  $scope.commentsLoader = true

  modal = $modal
    animation: 'am-fade-and-scale'
    placement: 'center'
    scope: $scope
    template: '/assets/app/templates/questions/details.tpl.html'
    show: true

  $scope.$on 'modal.hide', ->
    $state.go 'categories.questions', category_id: params.category_id

  loadComments = ->
    Comments.all(params.category_id, params.question_id).$promise.then (comments) ->
      $timeout ->
        $scope.comments = comments
        $scope.commentsLoader = false
      , 1000

  Questions.index(params.category_id, params.question_id).$promise.then (question) ->
    $timeout ->
      $scope.question = question
      $scope.questionLoader = false
      loadComments() unless question.status is 'close'
    , 1000

  $scope.submitComment = ->
    comment = comment:
      body: modal.$scope.comment
      question_id: params.question_id

    modal.$scope.comment = ''
    $scope.comments.push comment.comment
    Comments.create params.category_id, params.question_id, comment
]
