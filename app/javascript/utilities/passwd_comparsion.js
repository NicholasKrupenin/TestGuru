document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('.octicon-check-circle-fill')) { new PasswordComparsion } })

  class PasswordComparsion {
  constructor() {
    this.passwordField = document.getElementById('user_password');
    this.confirmPasswordField = document.getElementById('user_password_confirmation');
    this.octicon = document.querySelector('.octicon-check-circle-fill')
    this.addEvent()
  }

  addEvent() {
    this.passwordField.addEventListener('keyup', this.check.bind(this))
    this.confirmPasswordField.addEventListener('keyup', this.check.bind(this))
  }

  check() {
      if (this.passwordField.value === this.confirmPasswordField.value) {
        this.octicon.classList.remove('hide');
      } else {
        this.octicon.classList.add('hide');
      }
  }
}
