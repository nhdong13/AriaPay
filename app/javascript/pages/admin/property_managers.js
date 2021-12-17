window.propertyManagersInit = {
  init() {
    this.formValidate(),
    this.initSidebar(),
    this.initSelect2(),
    this.initHSUnfold(),
    $("#sort-by").on('change', function() {
      this.form.submit()
    })
  },

  initSidebar() {
    $('.js-navbar-vertical-aside').hsSideNav();
  },

  initSelect2() {
    $('.js-select2-custom').each(function () {
      $.HSCore.components.HSSelect2.init($(this));
    });
  },

  initHSUnfold() {
    $('.js-hs-unfold-invoker').each(function () {
      new HSUnfold($(this)).init();
    });
  },

  formValidate() {  
    $('#invite-property-manager').validate({
      rules: {
        'first_name': {
          required: true
        },
        'last_name': {
          required: true
        },
        'company_name': {
          required: true
        },
        'email': {
          required: true,
          email: true
        }
      }
    })
  }
}
