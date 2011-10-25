# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("a[data-enable-dueon]").live 'click', (event) ->
    calendar = $(this).parentsUntil("div.fields").last().find(".due_on")
    calendar.show().find("[disabled]").attr("disabled", false)
    $(this).remove()
    false

  $("a:contains('Load more')").click ->
    self = $ this
    $.ajax
      dataType: "script"
      url: self.attr("href")
      # success: (data) ->
      #   $("#lists").append(data)
    false
