window.resetPasswordInit = {
  init() {
    this.formValidate()
  },

  formValidate() {
    $('#user-reset-password').validate({
      rules: {
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
