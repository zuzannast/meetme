$( document ).ready(function() {
  var datetimeInputField = document.getElementById('datetime-input-field');
  var datetimeSelect = document.getElementById('datetime-select');
  var futureMoment = moment().add(2, 'months');
  var dialog = new mdDateTimePicker['default']({
    type: 'date',
    trigger: datetimeInputField,
    future: futureMoment
   });

  if (datetimeSelect){
    document.getElementById('datetime-select').addEventListener('click', function() {
      dialog.toggle();
    });
  };

  if (datetimeInputField) {
    datetimeInputField.addEventListener('onOk', function() {
      this.value = dialog.time.format("dddd, MMMM Do YYYY");
      $('#date-field').removeClass('hidden');
    });
  };
});
