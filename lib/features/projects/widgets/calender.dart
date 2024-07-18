import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';

class CalenderToday extends StatefulWidget {
  const CalenderToday({Key? key}) : super(key: key);

  @override
  _CalenderTodayState createState() => _CalenderTodayState();
}

class _CalenderTodayState extends State<CalenderToday> {
  final _calendarControllerToday = AdvancedCalendarController.today();
  final events = <DateTime>[
    DateTime.now(),
    DateTime(2024, 07, 17),
    DateTime(2024, 07, 18),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
  return
    Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    AdvancedCalendar(
    controller: _calendarControllerToday,
    events: events,
    weekLineHeight: 48.0,
    startWeekDay: 1,
    innerDot: true,
    keepLineSize: true,
    calendarTextStyle: const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    height: 1.3125,
    letterSpacing: 0,
    ),)
      ],
    );
        }
   }