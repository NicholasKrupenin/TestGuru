document.addEventListener('turbolinks:load', () => {
  if (document.querySelectorAll('.table-patch-link')) { new FormInline(); }
})

class FormInline {
  constructor() {
    this.links = document.querySelectorAll('.table-patch-link')

    this.bindEvents()
  }

  bindEvents() {
    this.links.forEach(link => {
      link.addEventListener('click', this.formInlineLinkHandler.bind(this))
    })
  }

  formInlineLinkHandler(event) {
    event.preventDefault();
    let testId = event.target.dataset.testId;
    this.formInlineHandler(testId);
  }

  formInlineHandler(testId) {
    let title = document.querySelector('.test-title[data-test-id="' + testId + '"]')
    let formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')
    let full_editor = document.querySelector('.full-editor[data-test-id="' + testId + '"]')
    formInline.classList.toggle('hide')
    title.classList.toggle('hide')
    full_editor.classList.toggle('hide')
  }
}
