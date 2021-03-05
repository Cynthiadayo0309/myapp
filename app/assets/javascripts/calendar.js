$(document).ready(function() {
    $('#calendar').fullCalendar({
        googleCalendarApiKey: 'gon.google_calendar_API_key',
        eventSources: [
            {
                googleCalendarId: 'gon.calendar_id_1',
            },
            {
                googleCalendarId: 'gon.calendar_id_2',
            }
        ]
    });
});