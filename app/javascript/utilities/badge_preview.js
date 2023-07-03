document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('#badge_image_tag')) { new BadgePreview } })

class BadgePreview {
  constructor() {
    this.imageField = document.getElementById('badge_image_url')
    this.imageUrl = document.getElementById('badge_image_tag')
    this.check();
  }

  check() {
    this.imageField.addEventListener('change', () => {
      if (this.imageField.value.match(/^(http|https)/)) {
        this.imageUrl.src = this.imageField.value
        this.imageUrl.classList.remove('hide')
      } else {
        this.imageUrl.classList.add('hide')
      }
    })
  }
}

