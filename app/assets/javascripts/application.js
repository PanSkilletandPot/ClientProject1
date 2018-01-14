// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require react
//= require react_ujs
//= require components
//= require_tree .
$( document ).ready(function() {
  console.log("ready");
  var iconButtonClicked = false

  $('#drop-down-icon').on("click", function(){
    if (iconButtonClicked == false) {
      $("#drop-down-ul").css("display", "flex")
      $("#drop-down-ul").animate({height:"160px"}, 400)
      console.log("false")
      iconButtonClicked = true
    } else {
      console.log("true")
      $("#drop-down-ul").animate({height:"0px"}, 400, function(){
        $("#drop-down-ul").css("display", "none")
      })
      iconButtonClicked = false
    }
  })
})
