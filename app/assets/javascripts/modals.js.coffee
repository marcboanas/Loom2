# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $modal = $('#modal')
  $modal_close = $modal.find('.close')
  $modal_container = $('#modal-container')
  dh = $modal.outerHeight()
  offset = $('#signin').offset()
 
  # Handle modal links with the data-remote attribute
  $(document).on 'ajax:success', 'a[data-remote]', (xhr, data, status) ->
    $modal
      .html(data)
      .prepend($modal_close)
      .css( top: $(window).scrollTop() - dh, opacity: 0, display: "block" )
      .animate({
        opacity: 1
        top: $(window).scrollTop() + 80 }, 1000)
      .show()
    $modal_container.show();
 
  $(document).on 'click', '#modal .close', ->
    $modal_container.hide()
    $modal.hide()
    false
    
  $(document).on 'click', 'html', =>
    if $modal.is(":visible") && $modal.attr('class') == 'signin'
      $modal_container.hide()
      $modal.hide()
      false

  $(document).on 'click', '#modal', (event) =>
    if $modal.is(":visible")
      event.stopPropagation();

  
