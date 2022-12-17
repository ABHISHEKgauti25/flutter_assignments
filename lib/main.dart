import 'package:event_scheduler/add_event.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List <Widget> _list= [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF978CDB),
        appBar: AppBar(
          backgroundColor: const Color(0xFF4B39B9),
          title: const Text('Event Scheduler'),
          centerTitle: false,
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              backgroundColor: const Color(0xFF4B39B9),
              child: const Icon(Icons.add),
              onPressed: () async {
                String newEvent = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewEventScreen()));
                setState(() {
                  _list.add(Text(newEvent,textAlign: TextAlign.center,));
                });
                },
            );
          }
        ),
        body: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context,index) =>
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                  child: Container(
                    alignment: Alignment.center,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: _list[index],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
