document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('.timer')) { new Timer } })

class Timer {
  constructor() {
    this.timerTest = document.querySelector('.timer')
    this.timerTestName = 'Timer' + this.timerTest.getAttribute('data-test-name')
    this.displayElement = document.querySelector('.knock_knock')
    this.timeDuration = this.displayElement.getAttribute('data-time-duration')
    this.timer = null
    this.start()
  }

  start() {
    let timer = localStorage.getItem(this.timerTestName) || this.timeDuration
    this.timer = setInterval(() => {
      let minutes = parseInt(timer / 60, 10)
      let seconds = parseInt(timer % 60, 10)

      minutes = minutes < 10 ? "0" + minutes : minutes
      seconds = seconds < 10 ? "0" + seconds : seconds

      this.displayElement.textContent = minutes + ":" + seconds

      if (--timer < 0) {
        localStorage.removeItem(this.timerTestName)
        this.stop()
      } else {
        localStorage.setItem(this.timerTestName, timer)
      }
    }, 1000)
  }

  stop() {
    clearInterval(this.timer)
    this.timer = null
    window.location.href = this.displayElement.getAttribute('data-waste-url')
  }
}
