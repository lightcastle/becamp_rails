$(document).ready(function() {
  var attendingFields = $('.attending');

  if ($('#user_attending option:selected').val() == 'true') {
    attendingFields.show();
  }

  $('#user_attending').change(function() {
    if ($('#user_attending option:selected').val() == 'true')  {
      attendingFields.show();
    } else {
      attendingFields.hide();
    }
  });
});
