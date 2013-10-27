$(function() {

$(document).ajaxSuccess(function() {

$('#add_income_form').bind('click', function(e) {
e.preventDefault();

var id = $('div.new_income_row .datepicker').attr('id');

$('div.new_income_row .datepicker').attr('id', id + '1');

var row = $('div.new_income_row').clone().removeClass('hidden new_income_row');
$('div.total').before(row);

$('#' + id + '1').datepicker({
numberOfMonths: 3,
showButtonPanel: true
});

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

$('.date').datepicker({
numberOfMonths: 3,
showButtonPanel: true
});

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

$('#add_income_form').bind('click', function(e) {
e.preventDefault();

var id = $('div.new_income_row .datepicker').attr('id');

$('div.new_income_row .datepicker').attr('id', id + '1');

var row = $('div.new_income_row').clone().removeClass('hidden new_income_row');
$('div.total').before(row);

$('#' + id + '1').datepicker({
numberOfMonths: 3,
showButtonPanel: true
});

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