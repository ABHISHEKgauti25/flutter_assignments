import 'package:flutter/material.dart';

class NewEventScreen extends StatefulWidget {
  const NewEventScreen({Key? key}) : super(key: key);

  @override
  State<NewEventScreen> createState() => _NewEventScreen();
}

class _NewEventScreen extends State<NewEventScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF978CDB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B39B9),
        title: const Text('New Event'),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF4B39B9),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    maxLines: null,
                    decoration: InputDecoration(
                      label: Text('Event',
                          style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                          icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: 30,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    controller: _textEditingController,
                  ),
                ),
              ),
            ),
            Builder(builder: (context) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB9B2E7),
                    minimumSize: const Size(450, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  onPressed: () {
                    String neweventText = _textEditingController.text;
                    Navigator.of(context).pop(neweventText);
                  },
                  child: const Text('ADD'),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
