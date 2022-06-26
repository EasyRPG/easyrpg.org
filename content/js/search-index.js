var pages = <%= make_search_index %>

document.addEventListener("DOMContentLoaded", function(event) {
  var input = document.getElementById("search-input")
  var form = document.getElementById("search-form")
  var resultsContainer = document.getElementById("search-results")
  var resultsHeading = document.getElementById("search-heading")

  var searchIndex = lunr(function () {
    this.field('title', { boost: 4 })
    this.field('tags', { boost: 2 })
    this.field('body')
    this.ref('id')
    // add all pages to search
    pages.forEach(function(page) { this.add(page) }, this)
  })

  var clearResults = function() {
    resultsContainer.innerHTML = ""
    resultsHeading.innerHTML = ""
  }

  var search = function(query) {
    clearResults();

    // find
    results = searchIndex.search(query).map(function(id) {
      for (var i = 0; i < pages.length; i++) {
        if (pages[i].id === id.ref)
          return pages[i]
      }
    })

    // render
    resultsHeading.innerHTML = results.length + " results found:"
    results.forEach(function(result) {
      var li = document.createElement("li")
      var a = document.createElement("a")
      a.href = result.id
      a.innerHTML = result.title
      li.appendChild(a)
      resultsContainer.appendChild(li)
    })
  }

  var searchQueryFromUrl = function() {
    var q;
    location.search.substr(1).split("&").forEach(function(item) {
      if (item[0] === "q")
        q = decodeURIComponent(item.substring(2))
    })
    return q;
  }

  form.addEventListener("submit", function(e) {
    var v = input.value
    history.pushState({ q: v }, "", "?q=" + encodeURIComponent(v))
    search(v)
    e.preventDefault()
  })

  window.onpopstate = function(event) {
    if (event.state !== null) {
      input.value = event.state.q
      search(input.value)
    } else {
      // clear
      input.value = ""
      clearResults()
    }
  }

  if (searchQueryFromUrl() !== undefined) {
    input.value = searchQueryFromUrl()
    search(input.value)
  }
})
