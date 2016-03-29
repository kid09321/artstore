// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/carousel
//= require bootstrap/dropdown
//= require bootstrap/collapse
//= require bootstrap/alert
//= require bootstrap/transition
//= require_tree .

$(document).ready(function(){
  $('.search-bar').on('click','.submit',function(){
    $(this).closest('form').submit();
  });
  $('.dropdown').find('a').attr("aria-expended","true");
  $('tr').on('change','select',function(e){
    e.preventDefault();
    var sum = 0;
    var quantity = +$("option:selected",this).text();
    var price = +$(this).closest('tr').find('.price').data('price');
    $(this).closest('tr').find('.total').text(quantity * price);
  $('.total').each(function(){

    sum += +$(this).text()
  });
    $('.cart-total').text("總計" + sum.toString() +"NTD");

    $(this).closest('form').submit();

});
});

