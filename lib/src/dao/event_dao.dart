import 'package:lappole/src/model/event.dart';

abstract class EventDao {
  Future<List<Event>> getEvents(String clubId);
  Future<List<Event>> getNoAuthEvents();
}
