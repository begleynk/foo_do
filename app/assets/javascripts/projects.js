console.log("asdasd");

var ready;
ready = function() {
  $('#datepicker').datepicker({
    format: "dd-mm-yyyy",
    todayBtn: "linked"
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);