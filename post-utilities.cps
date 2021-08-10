!(function (global) {
  var _ = {};
  
  var getElement = (objOrFunction, i) {
    if (_.isFunction(objOrFunction)) {
      return objOrFunction(i);
    } else {
      return objOrFunction[i];
    }
  };

  _.map = function (arr, f) {
    arr = arr || [];
    var result = [];
    for (var i = 0; i < arr.length; i++) {
      result.push(f(getElement(arr, i), i));
    }
    return result;
  };

  _.filter = function (arr, pred) {
    arr = arr || [];
    var result = [];
    for (var i = 0; i < arr.length; i++) {
      var element = getElement(arr, i);
      if (pred(element, i)) {
        result.push(element);
      }
    }
    return result;
  };

  _.find = function (arr, pred) {
    arr = arr || [];
    for (var i = 0; i < arr.length; i++) {
      var element = getElement(arr, i);
      if (pred(element, i)) {
        return element;
      }
    }
  };
  
  _.any = function (arr, pred) {
    return !!_.find(arr, pred);
  };

  _.forEach = function (arr, f) {
    _.map(arr, f);
  };

  _.apply = function (f, list, thisArg) {
    return f.apply(thisArg, list);
  };
  
  var objStringChecker = function (s) {
    return function (obj) {
      return Object.prototype.toString.call(obj) === "[object " + s + "]";
    };
  };
  
  _.isBoolean  = objStringChecker("Boolean");
  _.isFunction = objStringChecker("Function");
  _.isString   = objStringChecker("String");
  _.isNumber   = objStringChecker("Number");
  _.isDate     = objStringChecker("Date");
  _.isArray    = Array.isArray || objStringChecker("Array");

  global._ = _;
}(this));
