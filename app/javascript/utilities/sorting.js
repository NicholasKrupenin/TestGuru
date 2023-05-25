document.addEventListener('turbolinks:load', function() {
  let sortByTitleButton = document.querySelector('.sort-by-title')
  if (sortByTitleButton) { sortByTitleButton.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  let class_list = Array.from(document.querySelector('table').classList)
  let table = document.querySelector('table')
  let rows = table.querySelectorAll('tr')
  let sortedRows = []

  for (let i = 1; i < rows.length; i++) { sortedRows.push(rows[i]) }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort((a, b) => { return a.querySelector('td').textContent.
                                                localeCompare(b.querySelector('td').textContent) })

    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')

  } else {

    sortedRows.sort((a, b) => { return b.querySelector('td').textContent.
                                                localeCompare(a.querySelector('td').textContent) })

    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
  }

  let sortedTable = document.createElement('table')
  class_list.forEach((item) => { sortedTable.classList.add(item) })
  sortedTable.appendChild(rows[0])

  for (let i = 0; i < sortedRows.length; i++) { sortedTable.appendChild(sortedRows[i]) }

  table.parentNode.replaceChild(sortedTable, table)
}
