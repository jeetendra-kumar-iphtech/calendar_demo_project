import 'package:calendar_demo_project/provider/event_provider.dart';
import 'package:calendar_demo_project/screens/event_editing_screen.dart';
import 'package:calendar_demo_project/widgets/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendar Events App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: const CalendarWidget(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EventEditingScreen()));
          }),
    );
  }
}


// class _MyHomePageState extends State<MyHomePage> {
//   final CrCalendarController _controller = CrCalendarController();

//   void _showDatePicker(BuildContext context) {
//     showCrDatePicker(
//       context,
//       properties: DatePickerProperties(
//         firstWeekDay: WeekDay.monday,
//         okButtonBuilder: (onPress) =>
//             ElevatedButton(onPressed: () {}, child: const Text('OK')),
//         cancelButtonBuilder: (onPress) => OutlinedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('CANCEL')),
//         initialPickerDate: DateTime.now(),
//         onDateRangeSelected: (DateTime? rangeBegin, DateTime? rangeEnd) {},
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         _showDatePicker(context);
//       }),
//       body: CrCalendar(
//         initialDate: DateTime.now(),
//         controller: _controller,
//         // backgroundColor: Colors.amber,

//       ),
//     );
//   }
// }