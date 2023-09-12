import 'package:lappole/src/dao/event_dao.dart';
import 'package:lappole/src/model/event.dart';

class EventDaoImpl implements EventDao {
  @override
  Future<List<Event>> getEvents(String clubId) {
    List<Event> events = [];
    events.add(Event('123', 'Evento 1'));
    events.add(Event('124', 'Evento 2'));
    events.add(Event('125', 'Evento 3'));
    return Future.value(events);
  }

  @override
  Future<List<Event>> getNoAuthEvents() {
    List<Event> events = [];
    events.add(Event('126', 'Evento no Auth 1'));
    events.add(Event('127', 'Evento no Auth 2'));
    events.add(Event('128', 'Evento no Auth 3'));
    return Future.value(events);
  }
}
