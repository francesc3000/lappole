import 'package:lappole/src/dao/event_dao.dart';
import 'package:lappole/src/dao/user_dao.dart';
import 'package:lappole/src/main/dao/event_dao_impl.dart';
import 'package:lappole/src/user/dao/user_dao_impl.dart';

class FactoryDao {
  static const String mock = 'Mock';
  // final FirestoreRepositoryImpl _firestore = FirestoreRepositoryImpl();

  late UserDao userDao;
  late EventDao eventDao;

  FactoryDao() {
    userDao = UserDaoImpl();
    eventDao = EventDaoImpl();
    //   feedDao = FeedDaoImpl(_firestore);
  }
}
