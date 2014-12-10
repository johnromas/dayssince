# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	defaultcolor = $(".clickable-goal").first("div").css("background-color")
	$(".clickable-goal").mousedown ->
		$(this).children("div").css("background-color", "#ebebeb")
	$(".clickable-goal").mouseup ->
		$(this).children("div").css("background-color", defaultcolor)
	$(".clickable-goal").mouseout ->
		$(this).children("div").css("background-color", defaultcolor)

	$("#new_goal").hide()

	$("#new_goal_button").click ->
		$("#new_goal").toggle('slow')

	$("#new_goal").submit (event) ->
		event.preventDefault()
		$("#new_goal").hide('slow')
	$(".goal_delete_button").hide()
	$("#edit_goals_button").click ->
		$(".goal_delete_button").fadeIn()