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

  $( document ).tooltip({
                        track: true
                        });
  
  $('.alert').attr('title', 'Click to close');
  
  $('.alert').click(function() {
                     
                    $(this).remove();
                    
                     
                     });
  
  if ($(document).attr('title') == "Account Hero | Home") {
  
  $('.alert').addClass('moveUp');
  
  }
  
  $('input[type="text"]').keyup(function() {
  
                    $('.weekly').each(function() {
                    
                    var value = $(this).val();
                    
                    $(this).parent().find('.monthly').val(Number(value.replace(/[^0-9\.-]+/g,""))*52.1429/12);
                    
                    $(this).parent().find('.yearly').val(Number(value.replace(/[^0-9\.-]+/g,""))*52.1429);
                    
                    var hourly = $('#target_targets_hourly').val()
                    
                    var hours = $('#target_targets_hours').val()
                    
                    var income = hourly * hours
                    
                    $('#income').val(income);
                    
                    $('.disabled').formatCurrency({ colorize:true, region: 'cy-GB' });
                    
                    });
                    
                                var expense = 0;
                                
                                $('.expense_category').each(function() {
                                                            
                                expense += Number($(this).val().replace(/[^0-9\.-]+/g,""))
                                                            
                                                            });
                                
                                $('#expense').val(expense);
                                
                                
                                $('input[type="text"]').not(this).each(function() {
                                                                       
                                                                       $(this).blur();
                                                                       
                                                                       });
});
  
  $('input[type="text"]').keyup();
  
  $('.disabled').attr('readonly', 'readonly');

});


$(function() {
  
  var sectionId = $('.section-container').attr('id');
  
  $('#' + sectionId + 'Tab').addClass('active');
  
  var section_name = $('.section-container').attr('name');
  
  $('#' + section_name + 'Menu').addClass('active');
  
  $('.date').each(function(){
                  $(this).datepicker({
                                     numberOfMonths: 3,
                                     showButtonPanel: true
                                     });
                  $(this).attr('readonly', 'readonly');
                        });
  });

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
                                    
                                    $('.' + id + ' input, .' + id + ' label').prop('disabled', false).animate({opacity: 1.0});
                                    
                                    }
                                    
                                    else {
                                    
                                    $('.' + id + ' input, .' + id + ' label').prop('disabled', true).animate({opacity: 0.3},100);
                                    
                                    }
                                   
  });
  
  $('select').change();
  
});
  
  $('#student_passed_theory, #student_passed_practical').on('change', function(){
                                 
                                 var id = $(this).attr('id');
                                 
                                 if ($(this).prop("selectedIndex") == '1') {
                                 
                                                            $('.' + id + ' input, .' + id + ' label').prop('disabled', false).animate({opacity: 1.0});
                                 
                                 }
                                 
                                 else {
                                 
                                                            $('.' + id + ' input, .' + id + ' label').prop('disabled', true).animate({opacity: 0.3},100);
                                 
                                 }
                         
  });
  
  $('.modalOpen').on('click', function() {
                     
                     var id = $(this).attr('id');
                     $('#modal').addClass(id);
                     if ($(this).attr('id') == 'signin') {
                     var offset = $(this).offset();
                     var width = $('#modal').outerWidth() - 200;
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
                     var width = $('#modal').outerWidth() - 200;
                     $('#modal').css({left: offset.left - width});
                     }
                     else {
                     var offset = $('.section-container').offset();
                     var offsetLeft = offset.left + 2;
                     $('#modal').css({left: offsetLeft});
                     }
                     
  });
  
  $( window ).scroll(function() {
                     
                     var offset = $(window).scrollTop() + 70;
                     if ($('#modal').height() < 600) {
                     $('#modal').css({top: offset});
                     $('.drop-menu2').css({top: offset - 15});
                     }
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
  
                            
  $('.geo').on("focus", function() {
                                     
  var address = $(this).next(".address");
               
               
                                     
  $(this).geocomplete({
  country: 'uk',
  details: address,
  detailsAttribute: "data-geo"
  });
                                     
  });

  
  $(".input_address_0").on("click", function() {
                          
                          $(this).geocomplete({
                                             country: 'uk',
                                             details: ".address_0",
                                             detailsAttribute: "data-geo"
                                              });
  });
                          
  $(".input_address_1").on("click", function() {
                           
                           $(this).geocomplete({
                                               country: 'uk',
                                               details: ".address_1",
                                               detailsAttribute: "data-geo"
                                               });
                           });

  $(".input_address_2").on("click", function() {
                           
                           $(this).geocomplete({
                                               country: 'uk',
                                               details: ".address_2",
                                               detailsAttribute: "data-geo"
                                               });
                           });
  
  $(".input_address_3").on("click", function() {
                           
                           $(this).geocomplete({
                                               country: 'uk',
                                               details: ".address_3",
                                               detailsAttribute: "data-geo"
                                               });
                           });
  
  $(document).ajaxSuccess( function() {
  
  $("#student_address_location").geocomplete({
                                             country: 'uk',
                                             details: ".student_address",
                                             detailsAttribute: "data-geo"
                                             });
                                    });
  
  $(document).on( 'keypress','.currency', function(event) {
                 if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
                 event.preventDefault();
                 }
                 });
 
  
  $(document).on( 'blur', '.currency', function(){
                      if ($(this).val() != '') {
                          var num = parseFloat($(this).val());
                          var cleanNum = num.toFixed(2);
                          $(this).val(cleanNum);
                      }
                          });
  
  $('.currency').blur();
  
  
  $('#tax_return_employed').on("change", function() {
                              
                              if ($(this).val() != 'true') {
                              
                               $('div.employment input, div.employment select, div.employment label, div.employment h2').prop('disabled', true).animate({opacity: 0.3},100);
                              
                              }
                               else {
                               
                               $('div.employment input, div.employment select, div.employment label, div.employment h2').prop('disabled', false).animate({opacity: 1.0});
                               
                               }
                              
                              });
  
  $('#tax_return_employed').change();
  
});

$(function() {
  
  $('.menu-item').click(function(event) {
                        
                event.preventDefault();
                    
                 var offset = $(this).offset();
                 var id = $(this).attr('id');
                        var width = $(this).outerWidth();
                        var menuwidth = $('.' + id).outerWidth();
                        $('.' + id).css({left: offset.left + width - menuwidth}).slideDown();
                     
        });
  
  $(document).mouseup(function (e)
                      {
                      var container = $('.drop-menu');
                      
                      if (!container.is(e.target) // if the target of the click isn't the container...
                          && container.has(e.target).length === 0) // ... nor a descendant of the container
                      {
                      container.slideUp();
                      }
                      });
  
});



