$( document ).ready(function() {
  var dialog = new mdDateTimePicker['default']({
    type: 'date',
    trigger: document.getElementById('datetime-input-field')
   });

  document.getElementById('datetime-select').addEventListener('click', function() {
    dialog.toggle();
  });

  document.getElementById('datetime-input-field').addEventListener('onOk', function() {
    this.value = dialog.time.format("dddd, MMMM Do YYYY");
    $('#date-field').removeClass('hidden');
  });
});
