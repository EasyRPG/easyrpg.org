/* easyrpg snow on frontpage */

import Snowflakes from 'magic-snowflakes';

document.addEventListener("DOMContentLoaded", function() {
	// only fire in December to February
	const d = new Date();
	let month = d.getMonth();
	if(month == 11 || month < 2) {
		const colors = ["white", "lightgray", "floralwhite", "ghostwhite", "aliceblue", "azure"];
		const snowflakes = colors.map(makeSnowflakes);

		function makeSnowflakes(col) {
			return new Snowflakes({
				color: col,
				count: 10,
				minSize: 10,
				maxSize: 30,
				speed: 1.2,
			});
		}

		// a click removes them
		document.body.addEventListener("click", function() {
			snowflakes.forEach(function(flakes) {
				flakes.destroy();
			});
		});
	}
});
