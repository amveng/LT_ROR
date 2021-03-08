// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("@rails/activestorage").start();
require("channels");
// require("chartkick")
// require("chart.js")

require("moment/locale/ru");
require("tempusdominus-bootstrap-4");
import "../stylesheets/application";

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//.use(require("highcharts"))
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "bootstrap";

import "chartkick";

import "chart.js";

import "bootstrap-datepicker";

// $(function () {
//   $("#datetimepicker1").datetimepicker({
//     locale: "ru",
//     format: "L",
//     autoclose: true,
//   });
// });

// $(function () {
//   $("#datetimepicker2").datetimepicker({
//     locale: "ru",
//     format: "L",
//   });
// });
// $(document).on(function () {
//   var current_date = new Date();
//   const client_offset = parseInt(-current_date.getTimezoneOffset() / 60);
//   $('input[name="client_timezone"]').val(client_offset);
// });


  // $(function(){
  //   $('.datepicker').datepicker();
  // });

import 'jquery'

import * as $ from 'jquery';

$(function(){
  $('.datepicker').datepicker({              
      todayBtn: "linked",
      format: "yyyy-mm-dd",
      startDate: "2021-01-23",        
      todayHighlight: true,       
      autoclose: true,
      language: "ru",
  });
  console.log('datepiker load')
});


// $(document).on(function(){
//   $('.datepicker').datepicker();
//   console.log('datepiker load')
// });