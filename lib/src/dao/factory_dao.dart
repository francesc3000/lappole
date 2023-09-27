import 'package:lappole/src/dao/activity_dao.dart';
import 'package:lappole/src/dao/club_dao.dart';
import 'package:lappole/src/dao/stage_dao.dart';
import 'package:lappole/src/dao/user_dao.dart';
import 'package:lappole/src/ranking/dao/club_dao_impl.dart';
import 'package:lappole/src/stage/dao/stage_dao_impl.dart';
import 'package:lappole/src/user/dao/activity_dao_impl.dart';
import 'package:lappole/src/user/dao/user_dao_impl.dart';

class FactoryDao {
  static const String mock = 'Mock';
  // final FirestoreRepositoryImpl _firestore = FirestoreRepositoryImpl();

  late UserDao userDao;
  late StageDao stageDao;
  late ActivityDao activityDao;
  late ClubDao clubDao;

  FactoryDao() {
    userDao = UserDaoImpl();
    stageDao = StageDaoImpl();
    activityDao = ActivityDaoImpl();
    clubDao = ClubDaoImpl();
    //   feedDao = FeedDaoImpl(_firestore);
  }
}
