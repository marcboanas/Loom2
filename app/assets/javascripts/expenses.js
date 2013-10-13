$(function() {
  
  $(document).ajaxSuccess(function() {
                          
                          $('div.fixed_asset_true h2, .fixed_asset_true label, .fixed_asset_true input').animate({opacity: 1.0});
                          
                          $('div.fixed_asset_false h2, .fixed_asset_false label, .fixed_asset_false input').prop('disabled', true).animate({opacity: 0.3},100);
                          
                          });
  
  });