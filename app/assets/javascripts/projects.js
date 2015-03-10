
var ready;
ready = function() {
  $('#datepicker').datepicker({
    format: "dd-mm-yyyy",
    todayBtn: "linked"
  });


  $("#new-task-form").submit(function(event) {
    event.preventDefault();
    form = $('#new-task-form')
    body = {
      "task": {
      "title": $("#task-title").val()
      }
    };
 
    $.ajax({
      type: "POST",
      url: form.attr("action"),
      data: body,
      success: function(task) {
        $("#task-title").val("")
        $('#task-list').append("<li class='list-group-item'><div class='task' id='task_" + task.id + "'> <input type='checkbox' data-task-id='" + task.id + "' class='pull-right'>" + task.title + "</div> </li>");
      },
      failure: function(error) {
        console.log("error");
        console.log(error);
      }
    });
  });

  // When checkbox is clicked
  $("input[data-task-id]").change(function(event) {
    task_checkbox = $(event.target);
 
    data = {
      task: {
        completed: task_checkbox.is(":checked")
      }
    }
 
    $.ajax({
      type: "PUT",
      url: window.location.pathname + "/tasks/" + task_checkbox.attr("data-task-id"),
      data: data,
      success: function(task) {
        if (task.completed) {
          task_checkbox.parent().parent().addClass("list-group-item-success")
        } else {
          task_checkbox.parent().parent().removeClass("list-group-item-success")
        }
      },
      failure: function(error) {
        console.log("error");
        console.log(error);
      }
    });
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);