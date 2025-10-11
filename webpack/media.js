/* easyrpg media pages */

import GLightbox from 'glightbox'; // image viewer

document.addEventListener("DOMContentLoaded", function() {
	// create grouped galleries
	var lightboxScreenshots = GLightbox({
		selector: '#screenshots a'
	});

	var lightboxvideos = GLightbox({
		selector: '#videos a'
	});
});
