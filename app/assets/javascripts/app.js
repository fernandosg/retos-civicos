var app = angular.module('aquila', [
  'ngAnimate'
]);

app.directive('stringToNumber', function() {
  return {
    require: 'ngModel',
    link: function(scope, element, attrs, ngModel) {
      ngModel.$parsers.push(function(value) {
        return '' + value;
      });
      ngModel.$formatters.push(function(value) {
        return parseFloat(value, 10);
      });
    }
  };
});

app.controller('NewChallengeCtrl', [ '$interval', function($interval){
  var self = this;
  var stopInterval;

  function initialize() {
    self.image = undefined;

    self.newChallengeSteps = [
      { id: 0, image: '/assets/pasos/Paso-1-T.png', description: 'Lorem ipsum 0' },
      { id: 1, image: '/assets/pasos/Paso-2-T.png', description: 'Lorem ipsum 1' },
      { id: 2, image: '/assets/pasos/Paso-3-T.png', description: 'Lorem ipsum 2' },
      { id: 3, image: '/assets/pasos/Paso-3A-T.png', description: 'Lorem ipsum 3' },
      { id: 4, image: '/assets/pasos/Paso-3B-T.png', description: 'Lorem ipsum 4' },
      { id: 5, image: '/assets/pasos/Paso-4-T.png', description: 'Lorem ipsum 5' },
      { id: 6, image: '/assets/pasos/Paso-5-T.png', description: 'Lorem ipsum 6' },
      { id: 7, image: '/assets/pasos/Paso-6-T.png', description: 'Lorem ipsum 7' },
      { id: 8, image: '/assets/pasos/Paso-7-T.png', description: 'Lorem ipsum 8' },
      { id: 9, image: '/assets/pasos/Paso-8-T.png', description: 'Lorem ipsum 9' },
      { id: 10, image: '/assets/pasos/Paso-9-T.png', description: 'Lorem ipsum 10' },
    ];

    self.currentStep = self.newChallengeSteps[0];

    stopInterval = startInterval();
  }

  self.changeCurrentStep = function(idx) {
    // stop the interval
    $interval.cancel(stopInterval);

    // change the current step
    if(idx < self.newChallengeSteps.length) {
      self.currentStep = self.newChallengeSteps[idx];
    } else {
      self.currentStep = self.newChallengeSteps[0];
    }

    // start the interval again
    stopInterval = startInterval();
  };

  function startInterval(){
    var promise = $interval(function(){
      self.changeCurrentStep(self.currentStep.id + 1);
    }, 3000);

    return promise;
  }

  initialize();
}]);

app.controller('EvaluationCriteriaCtrl', function(){
  var self = this;
  self.criteriaList = [
    { description: "", value: undefined },
    { description: "", value: undefined },
    { description: "", value: undefined }
  ];

  self.add = function(idx){
    self.criteriaList.splice(idx + 1, 0, { description: "", value: "" });
  };

  self.remove = function(idx){
    self.criteriaList.splice(idx, 1);
  };

  self.percentage = function() {
    var total = 0;
    angular.forEach(self.criteriaList, function(criteria){
      total += criteria.value !== undefined ? criteria.value : 0;
    });
    return total;
  };
});
