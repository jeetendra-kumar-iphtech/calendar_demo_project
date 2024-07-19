import 'package:calendar_demo_project/model/event.dart';
import 'package:calendar_demo_project/provider/event_provider.dart';
import 'package:calendar_demo_project/screens/event_editing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventViewingScreen extends StatelessWidget {
  const EventViewingScreen({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => EventEditingScreen(event: event))),
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                final provider =
                    Provider.of<EventProvider>(context, listen: false);

                provider.deleteEvent(event);

                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          buildDateTime(event),
          const SizedBox(
            height: 32,
          ),
          Text(
            event.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            event.description,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  buildDateTime(Event event) {
    return Column(
      children: [
        buildDate(event.isAllDay ? 'All-Day' : 'From', event.from),
        if (!event.isAllDay) buildDate('To', event.to)
      ],
    );
  }

  Widget buildDate(String title, DateTime date) {
    return Column(
      children: [
        Row(
          children: [
            
          ],
        )
      ],
    );
  }
}
