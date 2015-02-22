// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



$(document).ready(function(){
	$(".class_tab").click(function(){
		console.log("click");
		$(this).css("background-color", "blue");
	});

	$('#lists').click(function() {
        $(this).removeClass("btn btn-default")
        $(this).addClass("btn btn-default disabled");
        $(this).parent().find('#calendar').removeClass("disabled");
      });

    $('#calendar').click(function() {
        $(this).removeClass("btn btn-default")
        $(this).addClass("btn btn-default disabled");     
        $(this).parent().find('#lists').removeClass("disabled"); 
      });

    $('#submit').click(function() {
    	console.log("clicked submit");
    	var params = {
    		courseName: $(this).parent().parent().find('#courseName').val(),
    		courseID: $(this).parent().parent().find('#courseID').val()
    	}
    	console.log(params);
    	$.ajax({
    		url: "/announcements/post_course",
    		method: 'POST',
    		data: params,
    		success: function(response) {
    			console.log(response);
    		},
    		failure: function(response) {

    		}
    	})

    });
});