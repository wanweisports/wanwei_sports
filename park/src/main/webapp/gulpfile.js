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
    gulp.src('./Content/stylus/**/**/*.styl')
        .pipe(plumber({errorHandler: notify.onError('error message: <%= error.message %>')}))
        .pipe(stylus({use: [nib()]}))
        .pipe(gulp.dest('./Content/dest'))
        .pipe(notify({
            message: '<%= file.relative %> mcompiled successful',
            title: 'minify css'}))
        .pipe(rename({suffix: '.min'}))
        .pipe(minifycss())
        .pipe(plumber.stop())
        .pipe(gulp.dest('./Content/dest'))
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
    gulp.src('./Content/stylus/**/*.styl')
    .pipe(watch(function(files) {
        return files.pipe(plumber({errorHandler: notify.onError('error message: <%= error.message %>')}))
            .pipe(stylus({use: [nib()]}))
            .pipe(gulp.dest('./Content/dist'))
            .pipe(notify({
                message: '<%= file.relative %> mcompiled successful',
                title: 'minify css'}))
            .pipe(rename({suffix: '.min'}))
            .pipe(minifycss())
            .pipe(plumber.stop())
            .pipe(gulp.dest('./Content/dist'))
            .pipe(notify({
                message: '<%= file.relative %> minified successful',
                title: 'minify css'}));
    }));
});

gulp.task('js-watch', function(){
    gulp.src(['./Content/scripts/corpLoan/**/*.js', '!./Content/scripts/corpLoan/Product/**'])
        .pipe(uglifyJs())
        .pipe(notify({
            title: 'minify js',
            message: '<%= file.relative %> mcompiled successful'
        }))
        .pipe(gulp.dest('./Content/Scripts/CorpLoan/Product'));
});

gulp.task('js-watch-shop', function(){
    gulp.src(['./Content/scripts/shop/**/*.js'])
        .pipe(uglifyJs({mangle: false}))
        .pipe(notify({
            title: 'minify js',
            message: '<%= file.relative %> mcompiled successful'
        }))
        .pipe(gulp.dest('./Content/scripts/dist/shop'));
});

gulp.task('js-watch-corp', function(){
    gulp.src(['./Content/scripts/apply/v1/index.js'])
        .pipe(uglifyJs({mangle: false}))
        .pipe(rename({suffix: '.min'}))
        .pipe(notify({
            title: 'minify js',
            message: '<%= file.relative %> mcompiled successful'
        }))
        .pipe(gulp.dest('./Content/scripts/apply/v1'));
});

gulp.task('css-watch-shop', function(){
    gulp.src('./Content/stylus/modules/shop/*.styl')
        .pipe(plumber({errorHandler: notify.onError('error message: <%= error.message %>')}))
        .pipe(stylus({use: [nib()]}))
        .pipe(gulp.dest('./Content/dest/modules/shop'))
        .pipe(notify({
            message: '<%= file.relative %> mcompiled successful',
            title: 'minify css'}))
        .pipe(rename({suffix: '.min'}))
        .pipe(minifycss())
        .pipe(plumber.stop())
        .pipe(gulp.dest('./Content/dest/modules/shop'))
        .pipe(notify({
            message: '<%= file.relative %> minified successful',
            title: 'minify css'}));
});


gulp.task('hint', function() {
    gulp.src('./Content/scripts/**/*.js')
    .pipe(watch(function(files) {
        return files.pipe(jshint())
            .pipe(jshint.reporter());
    }));
});

gulp.task('default', ['build']);
gulp.task('build', ['clean-files', 'stylus-compile']);
gulp.task('watch', ['stylus-watch']);
gulp.task('clean', ['clean-files']);
