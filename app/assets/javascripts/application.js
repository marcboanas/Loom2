// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require_tree .


$(function() {
  
alert('hello');

$('.selectable').live('change', function() {

$("#update_fields").load('/update_fields?expense_type_id=' + (this).value, function(){});
});

$(function() {

jQuery(".selectable option:first-child").attr("selected", true);
  
  $('.selectable').change();

});

$(function() {
  
  $('input[type="checkbox"]').each(function() {
  
  if (this.checked) {
  $(this).closest('.checklist_item').css('background', '#d2eded');
  }
  
  });
  
  var step = $('.step_hidden').attr('name');
  
  if (typeof step !== 'undefined') {
  
  $('.signup_step').each(function() {
  $(this).removeClass('active');
  });
  
  $('#' + step).addClass('active');
  
  }
  
  $('#accounting_start_date').live('change', function() {
  
  var selected = $(this).prop("selectedIndex");
                                   
  $('#default_year').prop("selectedIndex",selected);
                                   
  });
  
});
  
});

