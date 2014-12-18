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

$(function() {
	console.log('Up and Running');
	// click/play individual gif
	renderGifs()
	$('#gifs').on('click', 'img', viewGif);
	$('#search-button').click(searchGifs);
	$('#search-input').keydown(function (e) {
		if (e.keyCode === 13) {
			searchGifs()
		}
	});	
});


function renderGifs() {
	$.get('http://api.giphy.com/v1/gifs/search?q=sports&api_key=dc6zaTOxFJmzC').done(function(gifs) {
		for (var i = 0; i < gifs.data.length; i++) {
			var $img = $('<img />').attr('src', gifs.data[i].images.fixed_height.url); 
			$('#gifs').append($img);
		}	
	});
};



function viewGif() {
	$('img').hide();
	$(this).show();
	// var $img = $('<img />').attr('src', gifs.data[i].images.original.url); 
	// 		$('#gifs').append($img);
};




function searchGifs() {
	var userInput = $('#search-input').val()
	console.log(userInput);
	$.get('http://api.giphy.com/v1/gifs/search?q=' + userInput + '&api_key=dc6zaTOxFJmzC').done(function(gifs) {
		console.log(gifs);

		$('#gifs').empty();
		for (var i = 0; i < gifs.data.length; i++) {
			var $img = $('<img />').attr('src', gifs.data[i].images.fixed_height.url);
			$('#gifs').append($img);
		}

	});
};


	
		






