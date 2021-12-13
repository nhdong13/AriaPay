window.indexInit = {
  init() {
    this.initSwiper(),
    this.initHSMegaMenu()
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

  initHSMegaMenu() {
    new HSMegaMenu('.js-mega-menu', {
      desktop: {
        position: 'left'
      }
    })
  }
}
