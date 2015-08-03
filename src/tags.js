// Generated by CoffeeScript 1.8.0
(function() {
  var Tag, acf, matchAll, test;

  acf = [
    {
      "default": {
        loop: true,
        compile: function(slug) {
          var newString;
          newString = string.replace('{{' + slug + '}}', '<?php the_field("' + slug + '"); ?>');
          return newString;
        }
      }
    }
  ];

  matchAll = function(str, arr) {
    var item, _i, _len;
    for (_i = 0, _len = arr.length; _i < _len; _i++) {
      item = arr[_i];
      if (str.indexOf(item) === -1) {
        return false;
      }
    }
    return true;
  };

  Tag = (function() {
    function Tag(blob) {
      this.blob = blob;
      console.log(this.blob);
    }

    Tag.domain = function() {
      console.log('domain');
      if (this.blob.split('.').length > 1) {
        return this.blob.split('.')[0];
      } else {
        return 'default';
      }
    };

    Tag.base = function() {
      return console.log("base");
    };

    Tag.hasArgs = function() {};

    Tag.args = function() {
      console.log("args");
      if (matchAll(Tag.base(), ['(', ')'])) {
        return Tag.args(true);
      } else {
        return Tag.args(false);
      }
    };

    Tag.domain();

    return Tag;

  })();

  test = new Tag("test.testing('test1', 'test2')");

  console.log(test.hasArgs);

}).call(this);