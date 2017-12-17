// JavaScript Document

// JS: Local Stored  
function BuyProduct() {
	var numPro = localStorage.clickcount;
	
	if(typeof(Storage) !== "undefined") {
        if (localStorage.clickcount) {
            localStorage.clickcount = Number(localStorage.clickcount)+1;
        } else {
            localStorage.clickcount = 1;
        }
        document.getElementById("addCart").innerHTML = localStorage.clickcount;
    } else {
        document.getElementById("addCart").innerHTML = "Error";
    }
}
	
// Script for More item section

$(document).ready(function() {
 
  $("#owl-demo2").owlCarousel({
 
      autoPlay: 3000, //Set AutoPlay to 3 seconds
 		pagination: false,
      items : 4,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3]
 
  });
 
});

