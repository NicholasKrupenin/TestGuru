document.addEventListener('turbolinks:load', function() {
  if (document.querySelectorAll('.table-patch-link')) { new FormInline() }
})

class FormInline {
  constructor() {
    this.links = document.querySelectorAll('.table-patch-link')
    this.formInline = document.querySelector('.form-inline')
    this.testTitle = document.querySelector('.test-title')
    this.bindEvents()
  }

  bindEvents() {
    this.links.forEach(link => {
      link.addEventListener('click', this.formInlineLinkHandler.bind(this))
    })
  }

  formInlineLinkHandler(event) {
    event.preventDefault()
    this.formInline.classList.toggle('hide')
    this.testTitle.classList.toggle('hide')
  }
}
