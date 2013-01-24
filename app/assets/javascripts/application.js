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
//= require jquery.nested-fields
//= require bootstrap
//= require_tree .
function submitTeam()
{
	$('#add_member').toggle();
	//document.getElementById("custom_flash_warning_div").style.display="block";
	//$('#asset_file').attr("disabled", "disabled");
	//$('custom_flash_warning_div').toggle();
	// $('#submit_button').attr('onclick','').unbind('click');		
	//$('#flash_notice').text("Your task is being submitted. Please wait.")
	//$('#submission_text').text("Your task is being submitted. Please wait.");	
	$('#new_team').submit();	
	//return false;
	//$(document).bind("keydown", disableF5);
}
