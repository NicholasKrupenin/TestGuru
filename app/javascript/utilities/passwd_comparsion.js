document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('.octicon-check-circle-fill')) { new PasswordComparsion } })

  class PasswordComparsion {
  constructor() {
    this.passwordField = document.getElementById('user_password');
    this.confirmPasswordField = document.getElementById('user_password_confirmation');
    this.octicon = document.querySelector('.octicon-check-circle-fill')
    this.check()
  }

  check() {
    this.confirmPasswordField.addEventListener('keyup', () => {
      if (this.passwordField.value === this.confirmPasswordField.value) {
        this.octicon.classList.remove('hide');
      } else {
        this.octicon.classList.add('hide');
      }
    })
  }
}
