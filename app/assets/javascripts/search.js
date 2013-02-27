$(function() {
  $(".car-info .match").hide();
  $(".car-info ul").hide();
  $(".car-lookup form").bind("ajax:success", function(xhr, d, status) {
    $('.car-info ul').show();
    $('.car-info .match').show();
    $('.make').text(d.make);
    $('.model').text(d.model);
    $('.year').text(d.year);
    $('.vin').text(d.vin);
    $('.vid').text(d.vid);
    $('.trim').text(d.trim);
    $('.value').text(d.value);
  });
});
