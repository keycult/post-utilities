!(function (global) {
  var _ = {};

  _.map = function (arr, f) {
    arr = arr || [];
    var result = [];
    for (var i = 0; i < arr.length; i++) {
      result.push(f(arr[i], i));
    }
    return result;
  };

  _.filter = function (arr, pred) {
    arr = arr || [];
    var result = [];
    for (var i = 0; i < arr.length; i++) {
      if (pred(arr[i], i)) {
        result.push(arr[i]);
      }
    }
    return result;
  };

  _.find = function (arr, pred) {
    arr = arr || [];
    for (var i = 0; i < arr.length; i++) {
      if (pred(arr[i], i)) {
        return arr[i];
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
  
  _.isUndefined = function (obj) {
    return obj === undefined;
  };
  
  _.isBoolean = function (obj) {
    return Object.prototype.toString.call(obj) === "[object Boolean]";
  };

  global._ = _;
}(this));
