// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require foundation
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.foundation
//= require_tree .

$(function() {
	$(document).foundation();
});

$(document).ready(function() {

    	// Setup - add a text input to each footer cell
    	$('#MERL-members tfoot th').each( function () {
        		var title = $('#MERL-members thead th').eq( $(this).index() ).text();
        		$(this).html( '<input type="text" placeholder="Search '+title+'" />' );
    	} );
 
    	// DataTable
    	var table = $('#MERL-members').dataTable({
    		"iDisplayLength": 5,
    		"aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
    	});
 
    	// Apply the filter
    	table.columns().each( function ( colIdx ) {
        		$( 'input', table.column( colIdx ).footer() ).on( 'keyup change', function () {
            		table
            			.column( colIdx )
				.search( this.value )
				.draw();
        		} );
    	} );
} );