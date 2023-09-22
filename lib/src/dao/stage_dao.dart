import 'package:lappole/src/model/stage.dart';

abstract class StageDao {
  Future<List<Stage>> getStages(String clubId);
  Future<List<Stage>> getNoAuthStages();
}
