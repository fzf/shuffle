# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.js-add-player').click ->
    $(this).find('input:checkbox').prop("checked", true);
    $(this).toggleClass('icon-plus')
    $(this).toggleClass('icon-close');
    return
  return
