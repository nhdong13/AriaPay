window.editUserInit = {
  init() {
    this.formValidate(),
    this.initSidebar()
  },

  initSidebar() {
    $('.js-navbar-vertical-aside').hsSideNav();
  },

  formValidate() {  
    $('#edit_user').validate({
      rules: {
        'user[current_password]': {
          required: true
        },
        'user[password]': {
          required: true,
          minlength: 8
        },
        'user[password_confirmation]': {
          equalTo: "#user_password"
        },
      }
    })
  }
}
