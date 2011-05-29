// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

/* Bookings scripts */
jQuery(function(){
	d = new Date();
	jQuery("#booking_calendar").datepicker({
		minDate: d,
		maxDate: '+3m',
		onSelect: function(dateText, inst){
			jQuery("#booking_calendar").next('#booking_date').get(0).value = dateText;
		}
	});
	
	jQuery('#booking_time_4i > option').each(function(){
		if(parseInt(this.value) < 13 || parseInt(this.value) == 17 || parseInt(this.value) == 18 || parseInt(this.value) == 19)
			jQuery(this).detach();
	});
	
	jQuery('#booking_time_4i').change(function(){
		var value = parseInt(jQuery('#booking_time_4i option:selected').text());

		if( value == 23 || value == 16 ){
			jQuery('#booking_time_5i').val("00");
			jQuery('#booking_time_5i').get(0).disable();
		}
		else{
			jQuery('#booking_time_5i').get(0).enable();
		}
	});
});

