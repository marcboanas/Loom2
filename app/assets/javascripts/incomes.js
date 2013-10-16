$(function() {
  
  $('#add_income_form').bind('click', function(e) {
                             e.preventDefault();
                             var row = $('div.new_income_row').clone().removeClass('hidden new_income_row');
                             $('div.total').before(row);
                             $('i.remove').on('click', function() {
                                              $(this).closest('.income_row').remove();
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
                             $(this).closest('.income_row').remove();
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