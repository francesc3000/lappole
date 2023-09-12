import 'package:lappole/src/dao/user_dao.dart';
import 'package:lappole/src/user/dao/user_dao_impl.dart';

class FactoryDao {
  static const String mock = 'Mock';
  // final FirestoreRepositoryImpl _firestore = FirestoreRepositoryImpl();

  late UserDao userDao;
  // late RaceDaoImpl raceDao;
  // late TeamDaoImpl teamDao;
  // late CollaboratorDaoImpl collaboratorDao;
  // late FeedDaoImpl feedDao;
  //
  FactoryDao() {
    userDao = UserDaoImpl();
    //   raceDao = RaceDaoImpl(_firestore);
    //   teamDao = TeamDaoImpl(_firestore);
    //   collaboratorDao = CollaboratorDaoImpl(_firestore);
    //   feedDao = FeedDaoImpl(_firestore);
  }
}
