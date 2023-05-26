document.addEventListener('turbolinks:load', () => {
  let sortByTitleButton = document.querySelector('.sort-by-title')
  if (sortByTitleButton) { sortByTitleButton.addEventListener('click', () => { new SortTable }) } })

class SortTable {
  constructor() {
    this.class_list = Array.from(document.querySelector('table').classList)
    this.table = document.querySelector('table')
    this.rows = this.table.querySelectorAll('tr')
    this.sortedTable = document.createElement('table')
    this.sortedRows = []
    this.sortRowsByTitle()
  }

  sortRowsByTitle() {
    for (let i = 1; i < this.rows.length; i++) { this.sortedRows.push(this.rows[i]) }

    if (this.table.querySelector('.octicon-arrow-up').classList.contains('hide')) {
      this.sortedRows.sort((a, b) => { return a.querySelector('td').textContent.
                                               localeCompare(b.querySelector('td').textContent) })

      this.table.querySelector('.octicon-arrow-up').classList.remove('hide')
      this.table.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
      this.sortedRows.sort((a, b) => { return b.querySelector('td').textContent.
                                               localeCompare(a.querySelector('td').textContent) })

      this.table.querySelector('.octicon-arrow-up').classList.add('hide')
      this.table.querySelector('.octicon-arrow-down').classList.remove('hide')
    }

    this.class_list.forEach((item) => { this.sortedTable.classList.add(item) })
    this.sortedTable.appendChild(this.table.rows[0])

    for (let i = 0; i < this.sortedRows.length; i++) { this.sortedTable.appendChild(this.sortedRows[i]) }

    this.table.parentNode.replaceChild(this.sortedTable, this.table)
  }
}
