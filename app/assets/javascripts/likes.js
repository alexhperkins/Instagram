// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
	$('.like_comment').on('click', function(event) {
		var likes_count = $(this).siblings('.likes_count')
		event.preventDefault();

		$.post(this.href, function(response){
			likes_count.text(response.new_like_count)
		})
	});

});
