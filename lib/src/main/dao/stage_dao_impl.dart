import 'package:lappole/src/dao/stage_dao.dart';
import 'package:lappole/src/model/stage.dart';
import 'package:lappole/src/model/stage_data.dart';

class StageDaoImpl implements StageDao {
  @override
  Future<List<Stage>> getStages(String clubId) {
    List<Stage> stages = [];
    stages.add(
        Stage(id: '123', name: 'Stageo 1', stageData: StageData(counter: 1)));
    stages.add(
        Stage(id: '124', name: 'Stageo 2', stageData: StageData(counter: 2)));
    stages.add(
        Stage(id: '125', name: 'Stageo 3', stageData: StageData(counter: 3)));
    stages.add(
        Stage(id: '126', name: 'Stageo 4', stageData: StageData(counter: 4)));
    stages.add(
        Stage(id: '127', name: 'Stageo 5', stageData: StageData(counter: 5)));
    stages.add(
        Stage(id: '128', name: 'Stageo 6', stageData: StageData(counter: 6)));
    return Future.value(stages);
  }

  @override
  Future<List<Stage>> getNoAuthStages() {
    List<Stage> stages = [];
    stages.add(Stage(id: '126', name: 'Stageo no Auth 1'));
    stages.add(Stage(id: '127', name: 'Stageo no Auth 2'));
    stages.add(Stage(id: '128', name: 'Stageo no Auth 3'));
    return Future.value(stages);
  }
}
