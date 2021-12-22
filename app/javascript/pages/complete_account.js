window.completeAccountInit = {
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
    $('#user-complete-account').validate({
      rules: {
        'user[first_name]': {
          required: true
        },
        'user[last_name]': {
          required: true
        },
        'company_name': {
          required: true
        },
        'user[email]': {
          required: true,
          email: true
        },
        'user[password]': {
          required: true,
          minlength: 8,
          passwordConstraint: true
        },
        'user[password_confirmation]': {
          equalTo: "#user_password"
        },
      }
    })
  }
}
