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
        backgroundColor: const Color(0xFF7260BB),
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          backgroundColor: const Color(0xFF4C3E85),
          title: const Text('Event Scheduler'),
          centerTitle: true,
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            backgroundColor: const Color(0xFF4C3E85),
            child: const Icon(Icons.add),
            onPressed: () async {
              String newEvent = await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const NewEventScreen()));
              setState(() {
                _list.insert(0,
                    Text(newEvent,)
                );
              });
            },
          );
        }),
        body:ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              tileColor: const Color(0xFF4C3E85),
              textColor: Colors.white,
              title: _list[index],
              leading: const Icon(Icons.circle,color: Colors.white60,),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    color: Colors.white60,
                    icon: const Icon(Icons.delete),
                    onPressed: (){
                      setState(() {
                        _list.removeAt(index);
                      });
                    } ,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
