$(function() {
  
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