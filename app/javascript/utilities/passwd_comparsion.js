document.addEventListener('turbolinks:load', () => { new PasswordComparison });

class PasswordComparison {
  constructor() {
    this.passwordField = document.getElementById('user_password');
    this.confirmPasswordField = document.getElementById('user_password_confirmation');
    this.passwordField.addEventListener('keyup', this.check.bind(this));
    this.confirmPasswordField.addEventListener('keyup', this.check.bind(this));
    this.octicon = document.querySelector('.octicon-check-circle-fill')
  }

  check() {
    if (this.passwordField.value === this.confirmPasswordField.value) {
      this.octicon.classList.remove('hide');
    } else {
      this.octicon.classList.add('hide');
    }
  }
}
