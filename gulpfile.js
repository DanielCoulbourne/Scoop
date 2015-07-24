var gulp = require('gulp');
var ext_replace = require('gulp-ext-replace');
var del = require('del');
var scoop = require('./src/compiler.js');

gulp.task('clean', function(cb) {
  del(['build'], cb);
});

gulp.task('scoop', ['clean'], function() {
  return gulp.src('test/*.scoop')
  .pipe(scoop('prepended string'))
  .pipe(ext_replace('.php'))
  .pipe(gulp.dest('modified-files'));
});

gulp.task('default', ['scoop']);
