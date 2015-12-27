/*
 * Adds inline popups to media pages for screenshots and videos
 */
$(document).ready(function() {
	$('#screenshots').magnificPopup({
		delegate: 'a',
		type: 'image',
		closeOnContentClick: true,
		mainClass: 'mfp-img-mobile',
		image: {
			verticalFit: true
		}
	});
	$('#videos').magnificPopup({
		delegate: 'a',
		type: 'iframe',
		iframe: {
			patterns: {
				videos: {
					index: '/videos/',
					id: '',
					src: '%id%'
				}
			}
		}
	});
});
