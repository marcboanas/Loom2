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
//= require jquery.ui.all
//= require jquery_nested_form
//= require rails.validations
//= require_tree .


$(function() {

$('.selectable').on('change', function() {

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
  
  $('#user_previous_accountant').on('change', function() {

  var id = $(this).attr('id');
                                                                 
  if ($(this).prop("selectedIndex") == '1') {
  
  $('.' + id).show();
                                    
  }
                                    
  else {
    
  $('.' + id).hide();
                                    
  }
                                   
  });
  
  $('select').change();
  
});
  
  $( document ).ajaxSuccess( function() {
  
  $('#student_passed_theory').on('change', function(){
                                 
                                 var id = $(this).attr('id');
                                 
                                 if ($(this).prop("selectedIndex") == '1') {
                                 
                                 $('.' + id).show();
                                 
                                 }
                                 
                                 else {
                                 
                                 $('.' + id).hide();
                                 
                                 }
                                 
  });
  
    $('select').change();
                         
  });
  
  $('.modalOpen').on('click', function() {
                     
                     var id = $(this).attr('id');
                     $('#modal').addClass(id);
                     if ($(this).attr('id') == 'signin') {
                     var offset = $(this).offset();
                     var width = $('#modal').outerWidth() - $(this).outerWidth()
                     $('#modal').css({left: offset.left - width});
                     }
                     else {
                     var offset = $('.section-container').offset();
                     var offsetLeft = offset.left + 2;
                     $('#modal').css({left: offsetLeft});
                     }
                     
  });
  
  $( window ).resize(function() {

                     if ($('#modal').attr('class') == 'signin') {
                     var offset = $('#signin').offset();
                     var width = $('#modal').outerWidth() - $('#signin').outerWidth()
                     $('#modal').css({left: offset.left - width});
                     }
                     else {
                     var offset = $('.section-container').offset();
                     var offsetLeft = offset.left + 2;
                     $('#modal').css({left: offsetLeft});
                     }
                     
  });
  
  $( window ).scroll(function() {
                     
                     var offset = $(window).scrollTop() + 60;
                     $('#modal').css({top: offset});
                     
                     });
  
  $("#user_address_location").geocomplete({
  country: 'uk',
  details: ".business_address",
  detailsAttribute: "data-geo"
  });
  
  $("#user_previous_accountant_address_location").geocomplete({
  country: 'uk',
  details: ".user_previous_accountant",
  detailsAttribute: "data-geo"
  });
  
  $("#student_address_location").geocomplete({
  country: 'uk',
  details: ".student_address",
  detailsAttribute: "data-geo"
  });
  
  $(document).ajaxSuccess( function() {
  
  $("#student_address_location").geocomplete({
                                             country: 'uk',
                                             details: ".student_address",
                                             detailsAttribute: "data-geo"
                                             });
                                    });
  
});



