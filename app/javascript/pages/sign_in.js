window.signInInit = {
  init() {
    this.initSwiper(),
    this.formValidate()
  },

  initSwiper() {
    new Swiper('.js-swiper-hero-clients',{
      slidesPerView: 2,
      breakpoints: {
        480: {
          slidesPerView: 4,
          spaceBetween: 15,
        },
        768: {
          slidesPerView: 4,
          spaceBetween: 15,
        },
        1024: {
          slidesPerView: 6,
          spaceBetween: 15,
        },
      },
    });
  },

  formValidate() {
    $('#user-sign-in').validate({
      rules: {
        'user[email]': {
          required: true,
          email: true
        },
        'user[password]': {
          required: true
        }
      }
    })
  }
}
