$(function() {

$(document).ajaxSuccess(function() {
$('#add_student_form').bind('click', function(e) {
e.preventDefault();
var row = $('div.new_student_row').clone().removeClass('hidden new_student_row');
$('div.actions').before(row);
$('i.remove').on('click', function() {
$(this).closest('.student_row').remove();
});
$('.geo').on("focus", function() {

var address = $(this).next(".address");

$(this).geocomplete({
country: 'uk',
details: address,
detailsAttribute: "data-geo"
});

});
});

$('i.remove').on('click', function() {
$(this).closest('.student_row').remove();
});

});

$('#add_student_form').bind('click', function(e) {
e.preventDefault();
var row = $('div.new_student_row').clone().removeClass('hidden new_student_row');
$('div.actions').before(row);
$('i.remove').on('click', function() {
$(this).closest('.student_row').remove();
});
$('.geo').on("focus", function() {

var address = $(this).next(".address");

$(this).geocomplete({
country: 'uk',
details: address,
detailsAttribute: "data-geo"
});

});
});
});

$(function() {

$('i.remove').on('click', function() {
$(this).closest('.student_row').remove();
});
});