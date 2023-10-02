import 'package:lappole/src/dao/stage_dao.dart';
import 'package:lappole/src/model/stage.dart';
import 'package:lappole/src/model/stage_data.dart';

class StageDaoImpl implements StageDao {
  @override
  Future<List<Stage>> getStages(String clubId) {
    List<Stage> stages = [];
    StageData stageData1 = StageData(
        startDate: DateTime.now().subtract(const Duration(days: 7)),
        endDate: DateTime.now().subtract(const Duration(days: 7)));
    stageData1.addDistance(1);
    stages.add(Stage(
        id: '123',
        name: 'Subida al Aneto',
        distance: 100,
        stageData: stageData1));
    StageData stageData2 = StageData(
        startDate: DateTime.now().subtract(const Duration(days: 6)),
        endDate: DateTime.now().subtract(const Duration(days: 6)));
    stageData2.addDistance(2);
    stages.add(Stage(
        id: '124',
        name: 'Subida al Teide',
        distance: 200,
        stageData: stageData2));
    StageData stageData3 = StageData(
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 1)));
    stageData3.addDistance(3);
    stages.add(Stage(
        id: '125',
        name: 'Subida al Posets',
        distance: 300,
        stageData: stageData3));
    stages.add(Stage(
      id: '126',
      name: 'Subida a Balaitous',
      distance: 400,
    ));
    stages.add(Stage(
      id: '127',
      name: 'Subida al Monte Perdido',
      distance: 500,
    ));
    stages.add(Stage(
      id: '128',
      name: 'Subida a Balaitous',
      distance: 600,
    ));
    return Future.value(stages);
  }

  @override
  Future<List<Stage>> getNoAuthStages() {
    List<Stage> stages = [];
    stages.add(Stage(
      id: '123',
      name: 'Subida al Aneto',
      distance: 100,
    ));

    stages.add(Stage(
      id: '124',
      name: 'Subida al Teide',
      distance: 200,
    ));

    stages.add(Stage(
      id: '125',
      name: 'Subida al Posets',
      distance: 300,
    ));
    stages.add(Stage(
      id: '126',
      name: 'Subida a Balaitous',
      distance: 400,
    ));
    stages.add(Stage(
      id: '127',
      name: 'Subida al Monte Perdido',
      distance: 500,
    ));
    stages.add(Stage(
      id: '128',
      name: 'Subida a Balaitous',
      distance: 600,
    ));
    return Future.value(stages);
  }
}
