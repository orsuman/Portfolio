# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
 $("#lawyer").jpostal({
    postcode : [ "#lawyer_postal_code" ],
    address  : {
                  "#lawyer_prefecture" : "%3",
                  "#lawyer_address"            : "%4%5%6%7"
                }
  })