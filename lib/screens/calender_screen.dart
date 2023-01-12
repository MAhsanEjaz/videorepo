import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  CalendarController? controller;

  TextEditingController txtControl = TextEditingController();
  TextEditingController txt1Control = TextEditingController();

  List<Meeting> _getDataSource() {
    List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, 13, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(txt.toString(), selectDate ?? DateTime.now(), endTime,
        const Color(0xFF0F8644), false));
    meetings.add(Meeting(txt1.toString(), selectDate ?? DateTime.now(), endTime,
        const Color(0xFFf71189), false));

    for (int i = 0; i < meetings.length; i++) {}

    return meetings;
  }

  // List<Appointment> getMeetings(List<MyEventsModel> eventsList) {
  //   List<Appointment> meetings = [];
  //   Color color = Colors.transparent;
  //   if (eventsList.isNotEmpty) {
  //     eventsList.forEach((event) {
  //       if (event.themeColor!.toLowerCase() == 'red') {
  //         color = Colors.red;
  //       } else if (event.themeColor!.toLowerCase() == 'black') {
  //         color = Colors.black;
  //       } else if (event.themeColor!.toLowerCase() == 'blue') {
  //         color = Colors.blue;
  //       } else if (event.themeColor!.toLowerCase() == 'green') {
  //         color = Colors.green;
  //       } else {
  //         color = appColor;
  //       }
  //       meetings.add(Appointment(
  //           startTime: event.start!,
  //           endTime: event.end ?? event.start!,
  //           isAllDay: event.allDay ?? false,
  //           color: color,
  //           subject: event.title!,
  //           notes: event.description,
  //           id: event.eventId ?? ''));
  //     });
  //     log("meeting length is = ${meetings.length}");
  //   }
  //
  //   return meetings;
  // }

  String? txt;
  String? txt1;

  DateTime? selectDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SfCalendar(
                dataSource: MeetingDataSource(_getDataSource()),
                monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.indicator),
                view: CalendarView.month,
                // monthViewSettings: const MonthViewSettings(showAgenda: true),
                allowViewNavigation: true,
                allowedViews: [
                  CalendarView.month,
                  CalendarView.schedule,
                  CalendarView.week,
                  CalendarView.timelineMonth,
                  CalendarView.workWeek,
                  CalendarView.timelineDay,
                  CalendarView.day,
                ],
                allowAppointmentResize: true,
                allowDragAndDrop: true,
                timeSlotViewSettings: const TimeSlotViewSettings(),
                showWeekNumber: true,
                showCurrentTimeIndicator: true,
                showNavigationArrow: true,
                controller: controller,
                onTap: (val) {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: txtControl,
                                  ),
                                  TextField(
                                    controller: txt1Control,
                                  ),
                                  ElevatedButton(
                                      onPressed: () async {
                                        var date = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now()
                                                .subtract(Duration(days: 0)),
                                            lastDate: DateTime(2021, 30));

                                        selectDate = date;
                                        setState(() {});
                                      },
                                      child: Text('Select Date')),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                      onPressed: () {
                                        txt = txtControl.text;
                                        txt1 = txt1Control.text;
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Save'))
                                ],
                              ),
                            ),
                          ));
                },
                showDatePickerButton: true,
              ),
            ),
            // Text(selectDate.toString())
          ],
        ),
      )),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
