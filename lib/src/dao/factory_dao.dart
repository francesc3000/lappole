import 'package:lappole/src/dao/stage_dao.dart';
import 'package:lappole/src/dao/user_dao.dart';
import 'package:lappole/src/main/dao/stage_dao_impl.dart';
import 'package:lappole/src/user/dao/user_dao_impl.dart';

class FactoryDao {
  static const String mock = 'Mock';
  // final FirestoreRepositoryImpl _firestore = FirestoreRepositoryImpl();

  late UserDao userDao;
  late StageDao stageDao;

  FactoryDao() {
    userDao = UserDaoImpl();
    stageDao = StageDaoImpl();
    //   feedDao = FeedDaoImpl(_firestore);
  }
}
