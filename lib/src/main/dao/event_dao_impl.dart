import 'package:lappole/src/dao/event_dao.dart';
import 'package:lappole/src/model/event.dart';

class EventDaoImpl implements EventDao {
  @override
  Future<List<Event>> getEvents(String clubId) {
    List<Event> events = [];
    events.add(Event(id: '123', name: 'Evento 1'));
    events.add(Event(id: '124', name: 'Evento 2'));
    events.add(Event(id: '125', name: 'Evento 3'));
    return Future.value(events);
  }

  @override
  Future<List<Event>> getNoAuthEvents() {
    List<Event> events = [];
    events.add(Event(id: '126', name: 'Evento no Auth 1'));
    events.add(Event(id: '127', name: 'Evento no Auth 2'));
    events.add(Event(id: '128', name: 'Evento no Auth 3'));
    return Future.value(events);
  }
}
