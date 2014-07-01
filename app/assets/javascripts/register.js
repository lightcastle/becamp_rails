$(document).ready(function() {
  var attendingFields = $('.attending');

  if ($('#user_attending').is(':checked')) {
    attendingFields.show();
  }

  $('#user_attending').change(function() {
    if ($(this).is(":checked")) {
      attendingFields.show();
    } else {
      attendingFields.hide();
    }
  });
});
