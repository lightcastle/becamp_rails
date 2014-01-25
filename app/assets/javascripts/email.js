$(document).ready(function() {
  console.log('wooo');
  $('#emailForm').validate({
    rules: {
      email: {
        required: true,
        email: true
      },
    }
  });
});