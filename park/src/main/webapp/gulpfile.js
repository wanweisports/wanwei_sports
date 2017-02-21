var gulp = require('gulp');
var stylus = require('gulp-stylus');
var watch = require('gulp-watch');
var notify = require('gulp-notify');
var plumber = require('gulp-plumber');
var rename = require('gulp-rename');
var uglifyJs  = require('gulp-uglify');
var through = require('through');
var minifycss = require('gulp-minify-css');
var clean = require('gulp-clean');
var nib = require('nib');
var jshint = require('gulp-jshint');

gulp.task('stylus-compile', function() {
    gulp.src('./Content/style/**/*.styl')
        .pipe(plumber({errorHandler: notify.onError('error message: <%= error.message %>')}))
        .pipe(stylus({use: [nib()]}))
        .pipe(gulp.dest('./Content/style/'))
        .pipe(notify({
            message: '<%= file.relative %> compiled successful',
            title: 'minify css'}))
        .pipe(rename({suffix: '.min'}))
        .pipe(minifycss())
        .pipe(gulp.dest('./Content/style/'))
        .pipe(plumber.stop())
        .pipe(notify({
            message: '<%= file.relative %> minified successful',
            title: 'minify css'}));
});

gulp.task('clean-files', function() {
    gulp.src('./Content/dist/*', {read: false})
        .pipe(plumber({errorHandler: notify.onError('error message: <%= error.message %>')}))
        .pipe(clean({force: true}))
        .pipe(notify({
            message: '<%= file.relative %> has bean removed successful',
            title: 'clean files'}));
});

gulp.task('stylus-watch', function() {
    gulp.src('./Content/style/**/*.styl')
    .pipe(watch(function(files) {
        return files.pipe(plumber({errorHandler: notify.onError('error message: <%= error.message %>')}))
            .pipe(stylus({use: [nib()]}))
            .pipe(gulp.dest('./Content/style/'))
            .pipe(notify({
                message: '<%= file.relative %> compiled successful',
                title: 'minify css'}))
            .pipe(rename({suffix: '.min'}))
            .pipe(gulp.dest('./Content/style/'))
            .pipe(plumber.stop())
            .pipe(notify({
                message: '<%= file.relative %> watch successful',
                title: 'minify css'}));
    }));
});

gulp.task('js-watch', function () {
    gulp.src('./Content/app/**/*.js')
        .pipe(jshint())
        .pipe(jshint.reporter('default'))
        .pipe(notify({
            title: 'minify js',
            message: '<%= file.relative %> watch successful'
        }))
        .pipe(gulp.dest('./Content/dist'));
});

gulp.task('js-compile', function(){
    gulp.src('./Content/app/**/*.js')
        .pipe(uglifyJs())
        .pipe(notify({
            title: 'minify js',
            message: '<%= file.relative %> compiled successful'
        }))
        .pipe(gulp.dest('./Content/dist'));
});

gulp.task('js-hint', function() {
    gulp.src('./Content/app/**/*.js')
    .pipe(watch(function(files) {
        return files.pipe(jshint())
            .pipe(jshint.reporter());
    }));
});

gulp.task('default', ['build']);
gulp.task('build', ['clean-files', 'stylus-compile', 'js-compile']);
gulp.task('watch', ['stylus-watch', 'js-watch']);
gulp.task('clean', ['clean-files']);
