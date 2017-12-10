# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  $('#pick').change ->
   $(".select option[value='what']").remove()  
   pick = $('#pick').val()
   $('#hidden').show()
  return