import 'package:calendar_demo_project/model/event_data_source.dart';
import 'package:calendar_demo_project/provider/event_provider.dart';
import 'package:calendar_demo_project/widgets/tasks_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return SfCalendar(
      view: CalendarView.month,
      dataSource: EventDataSource(events),
      headerStyle: const CalendarHeaderStyle(
          textStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          textAlign: TextAlign.center),
      headerHeight: 70.0,
      showNavigationArrow: true,
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      monthViewSettings: const MonthViewSettings(
        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
      ),
      onTap: (details) {
        final provider = Provider.of<EventProvider>(context, listen: false);

        provider.setDate(details.date!);
        showModalBottomSheet(
            context: context, builder: (context) => const TasksWidget());
      },
    );
  }
}
