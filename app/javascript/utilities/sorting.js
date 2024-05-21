document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')

  control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle() {
  var table = document.querySelector('table')

  // NodeList
  // https://developer.mozilla.org/ru/docs/Web/API/NodeList
  var rows = table.querySelectorAll('tr')

  var sortedRows = []

  // select all table rows except the first one which is the header
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }
console.log(sortedRows)
}