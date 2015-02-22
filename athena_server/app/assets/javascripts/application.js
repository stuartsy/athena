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

var colors = ["#FFD2D2", "#FFE9D7", "#FFFDC0", "#E9FFD4", "#C0FFEA", "#C2EFFF", "#DAD9FF", "#FBC7FF"];


$(document).ready(function(){

	$(".hidden_color_update").each(function(index, elem) {
		var color = $(elem).html();
		$(elem).parent().css("background-color", color);
	});

	$(".hidden_color").each(function(index, elem) {
		var color = $(elem).html();
		$(elem).parent().find('.color_strip').css("background-color", color);
	});

	$(".class_tab").click(function(){

		if($(this).hasClass("selectedCourse")) {
			$(this).removeClass("selectedCourse");
			$(this).css("background-color", "#808080");
			$(this).css("color", "white");
			$(this).css("font-weight", "normal");
		} else {
			$(this).addClass("selectedCourse");
			$(this).css("background-color", $(this).find(".hidden_color").html());
			$(this).css("color", "black");
			$(this).css("font-weight", "bolder");
		}

		// here we are going to do the filtering



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
    		courseID: $(this).parent().parent().find('#courseID').val(),
    		courseColor: $(this).parent().parent().find('#courseColor').val()
    	}
    	console.log(params);
    	$.ajax({
    		url: "/announcements/post_course",
    		method: 'POST',
    		data: params,
    		success: function(response) {
    			console.log(response);
    			console.log("POST WAS A SUCCESS");
    			location.reload();
    		},
    		failure: function(response) {

    		}
    	})

    });
});