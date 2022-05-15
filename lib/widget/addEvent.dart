import 'package:flutter/material.dart';

class NewEvents extends StatefulWidget {
  final Function _addEvents;

  NewEvents(this._addEvents);

  @override
  State<NewEvents> createState() => _NewEventsState();
}

class _NewEventsState extends State<NewEvents> {
  final _titleinput = TextEditingController();

  void _submitEvent() {
    final submittedTitle = _titleinput.text;

    if (_titleinput.text.isEmpty) {
      return;
    }

    widget._addEvents(
      submittedTitle,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _titleinput,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _submitEvent,
                    child: const Text(
                      'Add Event',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
