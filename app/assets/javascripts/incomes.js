$(function() {
  
  $('#add_income_form').bind('click', function(e) {
                             e.preventDefault();
                             var row = $('div.new_income_row').clone().removeClass('hidden new_income_row');
                             $('div.total').before(row);
                             $('i.remove').on('click', function() {
                                              $(this).closest('.income_row').remove();
                                              });
                             });
});

$(function() {
  
  $('i.remove').on('click', function() {
                             $(this).closest('.income_row').remove();
                           });
  });