/* easyrpg player download page */

import $ from "cash-dom"; // jquery alternative
import GLightbox from 'glightbox'; // iframe viewer

// page start code
$(document).ready(function() {
	// easytabs replacement code, TODO: rewrite
	$('[id^=release-]').hide();
	$('[id^=snapshot-]').hide();

	// click functions
	$('#downloadtabs-release .tabbar li.tab').on("click", function() {
		$('#downloadtabs-release .tabbar li, #downloadtabs-release .tabbar li a').removeClass('active');
		$(this).addClass('active');
		$(this).find('a').addClass('active');
		$('[id^=release-]').hide();
		var activeTab = $(this).find('a').attr('href');
		$(activeTab).show();

		return false;
	});

	$('#downloadtabs-snapshot .tabbar li.tab').on("click", function() {
		$('#downloadtabs-snapshot .tabbar li, #downloadtabs-snapshot .tabbar li a').removeClass('active');
		$(this).addClass('active');
		$(this).find('a').addClass('active');
		$('[id^=snapshot-]').hide();
		var activeTab = $(this).find('a').attr('href');
		$(activeTab).show();

		return false;
	});

	// try to set default tabs
	var pf = navigator.platform.toLowerCase();
	var os = undefined;
	if (pf.indexOf("win")!=-1) {
		os = "windows";
	} else if (pf.indexOf("mac")!=-1) {
		os = "macos";
	} else if (pf.indexOf("x11")!=-1 || pf.indexOf("linux")!=-1) {
		os = "linux";
	} else if (pf.indexOf("android")!=-1) {
		os = "android";
	}
	if (!!os && location.hash === "") {
		// show both platform tabs
		var pfLink = $(".tabbar li.tab").find("a[href$=-" + os + "]");
		$(pfLink).trigger("click");
	} else {
		// show the first tabs
		$('.tabbar li:first-child').trigger("click");
	}
	// end of tab code

	// popup code
	var obsLightbox = GLightbox({ selector: null });
	obsLightbox.setElements([{
		// TODO: get params from anchor
		'href': 'https://software.opensuse.org/download/package.iframe?project=home%3Aeasyrpg&package=easyrpg-player&bcolor=ffffff&fcolor=000000&hcolor=2d631d',
	}]);
	var snapLightbox = GLightbox({ selector: null });
	snapLightbox.setElements([{
		'href': 'https://snapcraft.io/easyrpg-player/embedded?button=black&channels=true',
	}]);
	$("#obs-link").on("click", function() {
		obsLightbox.open();

		return false;
	});
	$("#snap-link").on("click", function() {
		snapLightbox.open();

		return false;
	});
	// end of popup code
});
