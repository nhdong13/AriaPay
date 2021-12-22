window.estatesInit = {
  init() {
    this.initSidebar(),
    this.formValidate()
  },

  initSidebar() {
    $('.js-navbar-vertical-aside').hsSideNav();
  },

  formValidate() {  
    $('#new_estate').validate({
      rules: {
        'estate[name]': {
          required: true
        },
        'estate[address]': {
          required: true
        },
        'estate[city]': {
          required: true
        },
        'estate[postcode]': {
          required: true
        },
        'estate[country]': {
          required: true
        },
      }
    })
  }
}
