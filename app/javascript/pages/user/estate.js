window.estateInit = {
  init() {
    this.initSidebar(),
    this.initSelect2(),
    this.formValidate()
  },

  initSidebar() {
    $('.js-navbar-vertical-aside').hsSideNav();
  },

  initSelect2() {
    $('.js-select2-custom').each(function () {
      $.HSCore.components.HSSelect2.init($(this));
    });
  },

  formValidate() {  
    $('#new_category').validate({
      rules: {
        'category[name]': {
          required: true
        },
        'category[category_type]': {
          required: true
        }
      }
    })
  }
}
