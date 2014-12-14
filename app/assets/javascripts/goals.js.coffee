# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$(".goal-checked").hide()

	$('body').find("[data-status='updated']").children(".goal-checked").show()

	$(".list-group-item").on("ajax:success", (e, data, status, xhr) ->
    $(this).children(".goal-checked").show()
  ).on "ajax:error", (e, xhr, status, error) ->
    $(this).append "<p>Already updated today!</p>"
