# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("a[data-enable-dueon]").live 'click', (event) ->
    calendar = $(this).parentsUntil("div.fields").last().find(".due_on")
    calendar.show().find("[disabled]").attr("disabled", false)
    $(this).remove()
    false

  $("a:contains('Load more')").live 'click', ->
    self = $ this
    $.ajax
      dataType: "html"
      url: self.attr("href")
      success: (data) ->
        html = $(data)
        if html.filter(".list, .right-list, .left-list").length == 0
          self.parent().remove()
          return
        $("#lists").append(data)
        $("a:last").parent().remove()
        current_page = parseInt(self.attr("href").match(/page=(\d+)/)[1], 10) + 1
        self.attr("href", "?page=" + current_page)
    false
