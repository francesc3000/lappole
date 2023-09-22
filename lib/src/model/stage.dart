import 'package:lappole/src/model/stage_data.dart';

class Stage {
  final String id;
  final String name;
  final StageData? stageData;

  Stage({required this.id, required this.name, this.stageData});

  bool get hasData => stageData == null ? false : true;
}
