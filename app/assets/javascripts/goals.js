$(document).ready(function(){
  $(".done-button").each(function(){
  	if ($(this).data('status') == 'updated') {
  		$(this).addClass('btn btn-primary btn-sm')
  	} else {
  		$(this).addClass('btn btn-white btn-sm')
  	}
  })

  $(".save_goal").click(function(){
  	$(".modal").modal('hide')
  })

  $(".reset_goal").click(function(){
    $(".modal").modal('hide')
  })

  $(".add_goal").click(function(){
    $("#goal_title").val("")
  })

  $('#new_goal_modal').on('shown.bs.modal', function (e) {
    $("#goal_title")[0].focus();
  })
  $('input').iCheck({
    checkboxClass: 'icheckbox_square-green',
    radioClass: 'iradio_square-green',
    increaseArea: '20%'
  });
})

var makeButtonGreen = function(button){
  button.removeClass('btn-white').addClass('btn-primary');
}

var makeButtonWhite = function(button){
  button.removeClass('btn-primary').addClass('btn-white');
}
