// Add new validator for Jquery Validation
$.validator.addMethod('passwordConstraint', function(value, element) {
    return this.optional(element) || /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9@#*$%^&+=-]).{8,}$/.test(value);
  }, `<p class="error mb-2"> Ensure that the following requirements are met: </p>
      <ul class="error ps-4">
        <li>Minimum 8 characters long - the more, the better</li>
        <li>At least one lowercase character</li>
        <li>At least one uppercase character</li>
        <li>At least one number or special character from this list @#*$%^&+-=</li>
      </ul>
      `
);
