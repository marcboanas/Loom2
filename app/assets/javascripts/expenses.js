$(function() {
  
  $(document).ajaxSuccess(function() {
                          
                          $('div.fixed_asset_true h2, .fixed_asset_true label, .fixed_asset_true input, .fixed_asset_true span').animate({opacity: 1.0});
                          
                          $('div.fixed_asset_false h2, .fixed_asset_false label, .fixed_asset_false input, .fixed_asset_false span').prop('disabled', true).animate({opacity: 0.3},100);
                          
                          });
  
  });


$(function() {
  
  $('#add_expense_form').bind('click', function(e) {
                             e.preventDefault();
                              
                              var id = $('div.new_expense_row .datepicker').attr('id');
                              
                              $('div.new_expense_row .datepicker').attr('id', id + '1');

                             var row = $('div.new_expense_row').clone().removeClass('hidden new_expense_row');
                             $('div.total').before(row);
                              
                              $('#' + id + '1').datepicker({
                                                           numberOfMonths: 3,
                                                           showButtonPanel: true
                                                           });
                        
                              
                             $('i.remove').on('click', function() {
                                              $(this).closest('.expense_row').remove();
                                              $('.value').keyup();
                                              });
                             $('.value').on('keyup', function() {
                                            
                                            var sum = 0;
                                            
                                            $('.value').each(function()
                                                             {
                                                             var val = (isNaN(parseFloat(this.value))) ? 0 : parseFloat(this.value);
                                                             sum += val;
                                                             });
                                            $('.total-right').html('£' + sum.toFixed(2));
                                            });

                              
                             });
  });

$(function() {
  
  $('i.remove').on('click', function() {
                   $(this).closest('.expense_row').remove();
                   $('.value').keyup();
                   });
  $('.value').on('keyup', function() {

                 var sum = 0;
                 
                 $('.value').each(function()
                                  {
                                  var val = (isNaN(parseFloat(this.value))) ? 0 : parseFloat(this.value);
                                  sum += val;
                                  });
                 $('.total-right').html('£' + sum.toFixed(2));
                 });
  
  });