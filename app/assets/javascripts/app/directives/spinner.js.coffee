drct = angular.module 'spinnerDirective', []

drct.directive 'spinner', ->
  restrict: 'E',
  replace: true,
  scope: show: '='
  template: '<div ng-show="show" class="text-center"><div class="spinner"></div><div>'
