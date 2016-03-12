/*
 * Adds tabs to download pages
 */
$(document).ready(function() {
	// add inline popup for OBS links
	$('#obs-link').magnificPopup({
		type: 'iframe',
		iframe: {
			patterns: {
				obs: {
					index: '/software.opensuse.org/download.html',
					id: 'download.html?',
					src: 'https://software.opensuse.org/download/package.iframe?%id%'
				}
			}
		}
	});

	// setup tabs
	$('#downloadtabs-snapshot, #downloadtabs-release').easytabs({
		animate: false,
		updateHash: false
	});

	// try to set default tabs
	pf = navigator.platform.toLowerCase();
	if (pf.indexOf("win")!=-1)     os = "windows";
	if (pf.indexOf("mac")!=-1)     os = "macosx";
	if (pf.indexOf("x11")!=-1)     os = "linux";
	if (pf.indexOf("linux")!=-1)   os = "linux";
	if (pf.indexOf("android")!=-1) os = "android";
	if (pf.indexOf("wii")!=-1)     os = "other";
	if (!!os) {
		$('#downloadtabs-snapshot').easytabs('select', '#snapshot-' + os);
		$('#downloadtabs-release').easytabs('select', '#release-' + os);
	}
});
