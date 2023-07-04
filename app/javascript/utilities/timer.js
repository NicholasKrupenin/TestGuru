document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('.timer')) { new Timer } })

class Timer {
  constructor() {
    this.timerTest = document.querySelector('.timer')
    this.displayElement = document.querySelector('.knock_knock')
    this.timeDuration = this.displayElement.getAttribute('data-time-duration')
    this.start()
  }

  start() {
    let timer = parseInt(this.timeDuration) - Math.floor(Date.now()/1000)
    this.timer = setInterval(() => {
      let minutes = parseInt(timer / 60, 10)
      let seconds = parseInt(timer % 60, 10)

      minutes = minutes < 10 ? "0" + minutes : minutes
      seconds = seconds < 10 ? "0" + seconds : seconds

      this.displayElement.textContent = minutes + ":" + seconds

      if (--timer < 0) {
        document.querySelector('form').submit()
      }
    }, 1000)
  }
}
