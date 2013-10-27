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
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require_tree .




$(function () {
$('.edit_target').validate({
rules: {
"target[targets][holidays]": { required: true, max: 51 }
}
});

$(document).tooltip({
track: !0
}), $(".alert").attr("title", ""), $(".alert").click(function () {
$(this).tooltip({
disabled: !0
}), $(this).animate({
opacity: 1
}), $(this).css("cursor", "auto")
}), $(document).attr("title") == "Account Hero | Home" && $(".alert").addClass("moveUp"), $(document).attr("title") == "Account Hero | Sign Up" && $(".section-container").css("margin-top", 0), $('input[type="text"]').keyup(function () {
var a = $("#target_targets_hourly").val(),
b = $("#target_targets_hours").val(),
week = 52;
if($("#target_targets_holidays").val() >= 0) {
weekHolidays = 52 - Number($("#target_targets_holidays").val().replace(/[^0-9\.-]+/g, ""));
};
var c = (a * b) * weekHolidays/52;
if(week < 0) { week = 0 };
$("#income").val(c);
var d = 0;
$(".expense_category").each(function () {
d += Number($(this).val().replace(/[^0-9\.-]+/g, ""))
}), $("#expense").val(d);
var e = c - d,
f = 0,
g = 0;
$("#profit").val(e), e > 5725 / week && (f = 2.7, $("#ni2").val(f)), e >= 7755 / week && e <= 41450 / week && (g = (e - 7755 / week) * .09, $("#ni4").val(g));
if (e > 41450 / week) {
var h = 58.158445349223,
i = (e - 41450 / week) * .02;
g = h + i, $("#ni4").val(g)
}
e < 7755 / week && (g = 0, $("#ni4").val(g)), e < 5725 / week && (f = 0, $("#ni2").val(f)), Number($("#userAge").attr("class")) > 65 && ($("#ni2").val(0), $("#ni4").val(0), f = 0, g = 0);
if (Number($("#userAge").attr("class")) > 65) {
$("#pa").val(10500 / week);
if (e > 26100 / week) {
var j = (e * week - 26100) / 2;
j > 10500 && (j = 10500), $("#pa").val((10500 - j) / week)
}
}
if (Number($("#userAge").attr("class")) > 75) {
$("#pa").val(10660 / week);
if (e > 26100 / week) {
var j = (e * week - 26100) / 2;
j > 10660 && (j = 10660), $("#pa").val((10660 - j) / week)
}
}
if (Number($("#userAge").attr("class")) < 65) {
$("#pa").val(9440 / week);
if (e > 1e5 / week) {
var j = (e * week - 1e5) / 2;
j > 9440 && (j = 9440), $("#pa").val((9440 - j) / week)
}
}
var k = $("#pa").val(),
l = e - k;
l < 0 && (l = 0), $("#totalTaxableIncome").val(l);
var m = 0;
l < 32011 / week && (m = l * .2), l > 32010 / week && (l < 150001 / week && (m = (l - 32010 / week) * .4 + 32010 / week * .2), l > 150001 / week && (m = 1027.9060044608182 + (l - 15e4 / week) * .45)), $("#tax").val(m), $("#earnings").val(e - m - f - g), $(".weekly").each(function () {
var a = $(this).val();
$(this).parent().find(".monthly").val(Number(a.replace(/[^0-9\.-]+/g, "")) * week / 12), $(this).parent().find(".yearly").val(Number(a.replace(/[^0-9\.-]+/g, "")) * week)
}), $(".disabled").formatCurrency({
colorize: !0,
region: "cy-GB"
}), $('input[type="text"]').not(this).each(function () {
$(this).blur()
})
}), $('input[type="text"]').keyup(), $(".disabled").attr("readonly", "readonly")
}), $(function () {

$(document).ajaxSuccess(function() {
var a = $(".form-section").attr("id");
$("#" + a + "Tab").addClass("active");
var b = $(".section-container").attr("name");
$("#" + b + "Menu").addClass("active");
});


var a = $(".section-container").attr("id");
$("#" + a + "Tab").addClass("active");
var b = $(".section-container").attr("name");
$("#" + b + "Menu").addClass("active"), $(".date").each(function () {
$(this).datepicker({
changeMonth: !0,
changeYear: !0,
dateFormat: "dd/mm/yy",
minDate: "-100Y",
maxDate: "-16Y",
yearRange: "-100:-16"
}), $(this).attr("readonly", "readonly")
})
}), $(function () {
$(".selectable").on("change", function () {
$("#update_fields").load("/update_fields?expense_type_id=" + this.value, function () {})
}), $(function () {
jQuery(".selectable option:first-child").attr("selected", !0), $(".selectable").change()
}), $(function () {
$('input[type="checkbox"]').each(function () {
this.checked && $(this).closest(".checklist_item").css("background", "#d2eded")
}), $("#user_weeks_accountant").on("change", function () {
var a = $(this).attr("id");
$(this).prop("selectedIndex") == "1" ? $("." + a + " input, ." + a + " label").prop("disabled", !1).animate({
opacity: 1
}) : $("." + a + " input, ." + a + " label").prop("disabled", !0).animate({
opacity: .3
}, 100)
}), $("select").change()
}), $("#student_passed_theory, #student_passed_practical").on("change", function () {
var a = $(this).attr("id");
$(this).prop("selectedIndex") == "1" ? $("." + a + " input, ." + a + " label").prop("disabled", !1).animate({
opacity: 1
}) : $("." + a + " input, ." + a + " label").prop("disabled", !0).animate({
opacity: .3
}, 100)
}), $(".modalOpen").on("click", function () {
var a = $(this).attr("id");
$("#modal").addClass(a);
if ($(this).attr("id") == "signin") {
var b = $(this).offset(),
c = $("#modal").outerWidth() - 200;
$("#modal").css({
left: b.left - c
})
} else {
var b = $(".section-container").offset(),
d = b.left + 2;
$("#modal").css({
left: d
})
}
}), $(window).resize(function () {
if ($("#modal").attr("class") == "signin") {
var a = $("#signin").offset(),
b = $("#modal").outerWidth() - 200;
$("#modal").css({
left: a.left - b
})
} else {
var a = $(".section-container").offset(),
c = a.left + 2;
$("#modal").css({
left: c
})
}
}), $(window).scroll(function () {
var a = $(window).scrollTop() + 70;
$("#modal").height() < 600 && ($("#modal").css({
top: a
}), $(".drop-menu2").css({
top: a - 15
}))
}), $("#user_address_location").geocomplete({
country: "uk",
details: ".business_address",
detailsAttribute: "data-geo"
}), $("#user_weeks_accountant_address_location").geocomplete({
country: "uk",
details: ".user_weeks_accountant",
detailsAttribute: "data-geo"
}), $(".geo").on("focus", function () {
var a = $(this).next(".address");
$(this).geocomplete({
country: "uk",
details: a,
detailsAttribute: "data-geo"
})
}), $(".input_address_0").on("click", function () {
$(this).geocomplete({
country: "uk",
details: ".address_0",
detailsAttribute: "data-geo"
})
}), $(".input_address_1").on("click", function () {
$(this).geocomplete({
country: "uk",
details: ".address_1",
detailsAttribute: "data-geo"
})
}), $(".input_address_2").on("click", function () {
$(this).geocomplete({
country: "uk",
details: ".address_2",
detailsAttribute: "data-geo"
})
}), $(".input_address_3").on("click", function () {
$(this).geocomplete({
country: "uk",
details: ".address_3",
detailsAttribute: "data-geo"
})
}), $(document).ajaxSuccess(function () {
$("#student_address_location").geocomplete({
country: "uk",
details: ".student_address",
detailsAttribute: "data-geo"
})
}), $(document).on("keypress", ".currency", function (a) {
(a.which != 46 || $(this).val().indexOf(".") != -1) && (a.which < 48 || a.which > 57) && a.preventDefault()
}), $(document).on("blur", ".currency", function () {
if ($(this).val() != "") {
var a = parseFloat($(this).val()),
b = a.toFixed(2);
$(this).val(b)
}
}), $(".currency").blur(), $("#tax_return_employed").on("change", function () {
$(this).val() != "true" ? $("div.employment input, div.employment select, div.employment label, div.employment h2").prop("disabled", !0).animate({
opacity: .3
}, 100) : $("div.employment input, div.employment select, div.employment label, div.employment h2").prop("disabled", !1).animate({
opacity: 1
})
}), $("#tax_return_employed").change()
}), $(function () {
$(".menu-item").click(function (a) {
a.preventDefault();
var b = $(this).offset(),
c = $(this).attr("id"),
d = $(this).outerWidth(),
e = $("." + c).outerWidth();
$("." + c).css({
left: b.left + d - e
}).slideDown()
}), $(document).mouseup(function (a) {
var b = $(".drop-menu");
!b.is(a.target) && b.has(a.target).length === 0 && b.slideUp()
})
});

jQuery.extend(jQuery.validator.messages, {
required: "This field is required.",
remote: "Please fix this field.",
email: "Please enter a valid email address.",
url: "Please enter a valid URL.",
date: "Please enter a valid date.",
dateISO: "Please enter a valid date (ISO).",
number: "Please enter a valid number.",
digits: "Please enter only digits.",
creditcard: "Please enter a valid credit card number.",
equalTo: "Please enter the same value again.",
accept: "Please enter a value with a valid extension.",
maxlength: jQuery.validator.format("Please enter no more than {0} characters."),
minlength: jQuery.validator.format("Please enter at least {0} characters."),
rangelength: jQuery.validator.format("Please enter a value between {0} and {1} characters long."),
range: jQuery.validator.format("Please enter a value between {0} and {1}."),
max: jQuery.validator.format("Value must be less than or equal to {0}."),
min: jQuery.validator.format("Please enter a value greater than or equal to {0}.")
});