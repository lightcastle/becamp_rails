$(document).ready(function() {
  $('#email-form').validate({
    rules: {
      email: {
        required: true,
        email: true
      },
    }
  });
});