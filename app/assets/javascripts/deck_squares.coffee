# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  el = document.getElementById("sortable_list")
  if el != null
    sortable = Sortable.create(el,
    delay: 5,
    onUpdate: (evt) ->

        $.ajax
          url: 'deck_squares' + '/sort'
          type: 'patch'
          data: { from: evt.oldIndex + 1, to: evt.newIndex + 1}

    )