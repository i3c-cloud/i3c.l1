

var gulp = require('gulp');
var spawn = require('child_process').spawn
var exec = require('child_process').exec;
var fs = require('fs');
var HJSON = require('hjson');

var rawdata = fs.readFileSync('.vscode/tasks.json'); 
//console.log(rawdata.toString()); 
var student = HJSON.parse(rawdata.toString()); 
//console.log(student);

student.tasks.forEach(function(task) {
  var taskLabel = task.label;
  var taskCommand = task.command;
  //console.log(taskLabel);

  gulp.task(taskLabel, function(cb) {
    console.log(taskCommand);
    console.log("=====|||=====");
    var iPs = exec(taskCommand);
    iPs.stdout.pipe(process.stdout);
    iPs.stderr.on('data', function(data) {
        console.log('error: ' + data);
    });
    iPs.on('close', function(code) {
      console.log("=====|||=====");
        console.log('returnCode: ' + code);
        cb(code);
    });
  });  
});

//gulp.task('/i', function(cb) {
//    console.log("/i start ...") ;
//    cb(0);
  /*  console.log("================================================================================================================================");
    var iPs = exec('/i ps');
    iPs.stdout.pipe(process.stdout);
    iPs.stderr.on('data', function(data) {
        console.log('error: ' + data);
    });
    iPs.on('close', function(code) {
        console.log("================================================================================================================================");
        console.log('/i returnCode: ' + code);
        cb(code);
    });*/

    /*ls    = spawn('/i', ['ps', '/usr']);

    ls.stdout.on('data', function (data) {
        data.
        console.log(data.toString());
      });
      
      ls.stderr.on('data', function (data) {
        console.log(data.toString());
      });
      
      ls.on('exit', function (code) {
        console.log("================================================================");
        console.log('/i child process exited with code ' + code.toString());
        cb(code);
      });*/

//});
