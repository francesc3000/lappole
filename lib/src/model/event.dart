import 'package:lappole/src/model/event_data.dart';

class Event {
  final String id;
  final String name;
  final EventData? eventData;

  Event({required this.id, required this.name, this.eventData});

  bool get hasData => eventData == null ? false : true;
}
