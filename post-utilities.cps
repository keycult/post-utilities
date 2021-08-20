!(function (global) {
  var _ = {};

  /* General JavaScript Utilities */

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
      var element = arr[i];
      if (pred(element, i)) {
        result.push(element);
      }
    }
    return result;
  };

  _.find = function (arr, pred) {
    arr = arr || [];
    for (var i = 0; i < arr.length; i++) {
      var element = arr[i];
      if (pred(element, i)) {
        return element;
      }
    }
  };
  
  _.any = function (arr, pred) {
    return !!_.find(arr, pred);
  };

  _.every = function (arr, pred) {
    return arr.length === _.filter(arr, pred).length;
  };

  _.forEach = function (arr, f) {
    _.map(arr, f);
  };
  
  _.take = function (obj, n) {
    return obj.slice(0, n);
  };
  
  _.drop = function (obj, n) {
    return obj.slice(n, arr.length);
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

  _.isEqual = function (o1, o2) {
    return o1 === o2;
  };

  _.ensureArray = function (obj) {
    return _.isArray(obj) ? obj : [obj];
  };

  _.memoize = function (f) {
    var cache = {};

    return function (key) {
      var address = '' + key;

      if (!cache.hasOwnProperty(address)) {
        cache[address] = f(key);
      }

      return cache[address];
    }
  }

  /* Post API Utilities */

  _.allSections = _.memoize(function () {
    var result = [];

    for (var i = 0; i < global.getNumberOfSections(); i++) {
      result.push(global.getSection(i));
    }

    return result;
  });

  _.allTools = _.memoize(function () {
    var result = [];
    var tools = global.getToolTable();

    for (var i = 0; i < tools.getNumberOfTools(); i++) {
      result.push(tools.getTool(i));
    }

    return result;
  });

  global._ = _;
}(this));
