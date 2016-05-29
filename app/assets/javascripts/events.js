$( document ).ready(function() {
  var dialog = new mdDateTimePicker.default({
                type: 'date'
              });

  document.getElementById('datetime-select').addEventListener('click', function() {
    dialog.toggle();
  })

  document.getElementById('mddtp-date__ok').addEventListener('click', function() {
    document.getElementById('datetime-input').value = dialog.time.toString();
    $('#date-field').removeClass('hidden');
  });
});
