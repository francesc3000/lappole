import 'package:lappole/src/model/stage_data.dart';
import 'package:lappole/src/user/bloc/user_bloc.dart';

class Stage {
  final String id;
  final String name;
  final double distance;
  final StageData? stageData;

  Stage(
      {required this.id,
      required this.name,
      required this.distance,
      this.stageData});

  bool get hasData => stageData == null ? false : true;

  bool get isCurrent => stageData == null
      ? false
      : DateTime.now().isBetween(stageData!.startDate, stageData!.endDate);
}
