/*
 * Adds a toggle-able search overlay
 */
document.addEventListener("DOMContentLoaded", function(event) {
  // ignore on search page
  if (window.location.href.indexOf("/search/") === -1) {
    var overlay = document.getElementById('search-overlay')
    var input = document.getElementById("search-input")

    function searchBox(e) {
      if (e.target.id === "show-search") {
        overlay.className = "visible transitioning"
        input.focus();
      } else {
        overlay.className = "hidden transitioning"
      }
    }

    document.getElementById('show-search').addEventListener('click', searchBox)
    document.getElementById('hide-search').addEventListener('click', searchBox)
    input.addEventListener('keyup', function(e) {
      if (e.keyCode == 27) searchBox(e)
    })
    overlay.addEventListener('transitionend', function() {
      overlay.classList.remove("transitioning")
    })
  }
})
