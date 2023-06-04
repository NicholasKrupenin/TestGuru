document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('.progress-bar')) { new Progress() }
})

class Progress {
  constructor() {
    this.bar = document.querySelector('.progress-bar')
    this.test = parseInt(this.bar.dataset.currentTest)
    this.totalTest = parseInt(this.bar.dataset.allTest)
    this.increaseProgress()
  }

  increaseProgress() {
    let progressNow = (this.test * 100) / this.totalTest
    this.bar.setAttribute('aria-valuenow', progressNow)
    this.bar.style.width = progressNow + '%'
    this.bar.innerHTML = progressNow + '%'
  }
}
