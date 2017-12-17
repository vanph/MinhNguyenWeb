// JavaScript Document

<!-- Java script -->

<!--  addCs -->
	//scroll to add css
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();
		
        if (scroll >= 1) {
            $("#navtop").addClass("darkHeader");
        } else {
            $("#navtop").removeClass("darkHeader");
        }
    }); 
	//scroll 
	$("#navtop").mouseover(function() {
		$("#navtop").addClass("darkHeader");
		
	})
	$("#navtop").mouseout(function() {
		$("#navtop").removeClass("darkHeader");
		
	})


<!--Slider -->

$(document).ready(function() {
 //
  $("#owl-demo").owlCarousel({
 
      items:4,
      dots: true,
	    // Show next and prev buttons
      slideSpeed : 300,
      paginationSpeed : 400,
      singleItem:true,
	  autoPlay:true,
	  marginBottom:'-20px',
 
  });
 
});
// brand slide effect
$(document).ready(function() {
 
  $("#owl-demo1").owlCarousel({
	
    pagination: false,
	slideSpeed: 300,
	paginationSpeed : 300,
	autoPlay:true,
	
  });
 
});
