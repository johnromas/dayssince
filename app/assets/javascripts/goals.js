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


})

var makeButtonGreen = function(button){
  button.removeClass('btn-white').addClass('btn-primary');
}

var makeButtonWhite = function(button){
  button.removeClass('btn-primary').addClass('btn-white');
}
