<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <style>
#popup {
    display: none;
}
</style> -->

<%@ include file="./../../../include/header.jsp"%>


<link rel="stylesheet"
	href="https://fullcalendar.io/releases/fullcalendar/3.9.0/fullcalendar.min.css">
<link rel="stylesheet" href="./css/calstyle.css">


	<!-- partial:index.partial.html -->
	<div id="calendar" class="fc fc-unthemed fc-ltr"></div>
	
	<!-- <div id="popup"></div> -->
	
	
	<!-- partial -->
	<script
		src="https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js"></script>
	<script
		src="https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/jquery.min.js"></script>
	<script
		src="https://fullcalendar.io/releases/fullcalendar/3.9.0/fullcalendar.min.js"></script>
 <script src='fullcalendar/core/locales/ko.js'></script>

<script>
$(document).ready(function() {
/* 	var events = [{
        id: 1,
        title: 'This is a blocked day',
        start: 'Wed, 18 Oct 2009 08:00:00 EST',
        color:'#fff',// red
        blocked: true
    },
    {
        id: 2,
        title: 'This is an available day',
        start: 'Thu, 19 Oct 2009 08:00:00 EST',
        color: '#07A800', // green
        blocked: false
    }]; 
 */
    
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    $('#calendar').fullCalendar({
       header: {
            left: 'prev, next today',
            center: 'title',
            right: 'month, basicWeek, basicDay'
        },
        //events: "Calendar.asmx/EventList",
        //defaultView: 'dayView',
       /*  editable: true,
        droppable: true, // this allows things to be dropped onto the calendar
        drop: function(info) {
          // is the "remove after drop" checkbox checked?
          if (checkbox.checked) {
            // if so, remove the element from the "Draggable Events" list
            info.draggedEl.parentNode.removeChild(info.draggedEl);
          }
        },
        locale: 'ko' */
        /* dateClick: function() {
            alert('a day has been clicked!');
          }
 */
        /* eventClick: function(event) {
            // opens events in a popup window
            $('#popup').html('<iframe src="'+event.url+'" width="700" height="600"></iframe>');
            $('#popup').dialog({autoOpen: false, modal: true, width: 750, height: 675});
            return false;
        }, */

     /*    events: events,
        eventClick: function(calEvent, jsEvent, view) {
            if(calEvent.blocked == true) {// be sure to set a 'blocked' property in your event
                alert('This time is not available!');                
            } else {
                $('#newEventDialog').dialog('open');// open a dialog to save new event
            }
        }
         */
    });
  var data=[{'date':y+"-"+m+"-"+d,'title':'hi'},{'date':'2018-10-14','title':'bye'}]
      $.each(data, function(i) {
                                $('.fc-day[data-date="'+data[i]["date"]+'"]').html('<h4>'+data[i]["title"]+'</h4>');
                                $('.fc-day[data-date="'+data[i]["date"]+'"]').css('background', '#ff9f89');
    });

  $(".fc-day").click(function(){
	alert("클릭");

        /* var popUrl = "popup.html";
        var popOption = "top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no";
        window.open(popUrl, popOption); */
    
})
});
</script>
<%@ include file="./../../../include/footer.jsp"%>


















