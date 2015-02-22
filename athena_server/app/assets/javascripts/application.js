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

// var classColors = [new Class("MATH 42", "blue")];

// function Class(name, color) {
// this.name = name;
// this.color = color;
// }

var colorAssignments = {
	Math: "blue",
	CS: "pink"
}

$(function(){
	$(".class_tab").click(function(){
		console.log("click");
		if($(this).hasClass("selected_class")) {
			$(this).removeClass("selected_class");
			$(this).css("background-color", "transparent");
		} else {
			$(this).addClass("selected_class");
			// var nameOfClass = $(this).children(".class_name").html();
			var nameOfClass = "CS";
			$(this).css("background-color", colorAssignments[nameOfClass]);
			console.log(nameOfClass);
			console.log(colorAssignments[nameOfClass]);
		}

	})
})