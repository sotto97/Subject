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
//= require rails-ujs
//= require activestorage
//= require jquery
//= require bootstrap-sprockets
//= require_tree .
//= require moment
//= require fullcalendar

// Event カレンダー
$(function (){
	function eventCalendar(){
		return $('#calendar').fullCalendar({});
	};
	function clearCalendar(){
		$('#calendar').html('');
	};
	$(document).on('turbolinks:load', function () {
    eventCalendar();
	});
	$(document).on('turbolinks:before-cache', clearCalendar);

	$('#calendar').fullCalendar({
    events: '/events.json',
    titleFormat: 'M月',
     // ↑表示の変更
    header: {
    	left: '',
    	center: 'title',
    	right: 'today prev,next'
    },
    timeFormat: "HH:mm",
    eventColor: '#63ceff',
    eventTextColor: '#000',
	});
});

// home画面

const inputs = document.querySelectorAll('.input');

function focusFunc(){
    let parent = this.parentNode.parentNode;
    parent.classlist.add('focus');
}

function focusFunc(){
    let parent = this.parentNode.parentNode;
    if (this.value == ""){
        parent.classlist.remove('focus');
    }
}

inputs.forEach(input => {
    input.addEventListener('focus'.focusFunc);
    input.addEventListener('blur'.blurFunc);
});

