window.forgotPasswordInit = {
  init() {
    this.formValidate()
  },

  formValidate() {
    $('#user-forgot-password').validate({
      rules: {
        'user[email]': {
          required: true,
          email: true
        }
      }
    })
  }
}
