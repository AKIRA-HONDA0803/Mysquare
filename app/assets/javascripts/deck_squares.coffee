# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  el = document.getElementById("sortable_list")
  if el != null
    sortable = Sortable.create(el,
    delay: 10,
    onUpdate: (evt) ->
        console.log(evt.oldIndex)
        console.log("=========")
        console.log(evt.newIndex)

        # if evt.newIndex == 0
        #   evt.newIndex = 1
        # else if  evt.oldIndex == 0
        #   console.log("ok")
        #   evt.newIndex -= 1
        # else
        #   console.log("test")
        #   # evt.newIndex -= 1

         #if evt.oldIndex == 0
           #evt.oldIndex = 1
           #evt.newIndex ++
        # else
        #   console.log("マイナス")
        #   evt.oldIndex -= 1


        console.log("変更後")
        console.log(evt.oldIndex)
        console.log(evt.newIndex)

        $.ajax
          url: 'deck_squares' + '/sort'
          type: 'patch'
          data: { from: evt.oldIndex + 1, to: evt.newIndex + 1}

        # window.location.reload()
    )