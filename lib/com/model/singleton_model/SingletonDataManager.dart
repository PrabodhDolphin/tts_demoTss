import 'package:tts_demo/com/model/exercise_model/exercise_model.dart';

class SingletonDataManager {
  static int count = 1;

  SingletonDataManager._privateConstructor();

  static final SingletonDataManager _instance =
      SingletonDataManager._privateConstructor();

  factory SingletonDataManager() {
    return _instance;
  }
  static List<ExerciseData> exeList = [];

}
