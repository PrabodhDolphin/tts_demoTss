class ExerciseModel {
  String exerciseStackName = "";
  List<ExerciseData> exerciseStackList = [];

  ExerciseModel(
      {this.exerciseStackName = "", this.exerciseStackList = const []});

  ExerciseModel.fromJson(Map<String, dynamic> json) {
    exerciseStackName = json['customer_id'];
    exerciseStackList = json['firstname'];

    if (json['exerciseStackList'] != null) {
      //exerciseStackList = new List<ExerciseData>();
      json['exerciseStackList'].forEach((v) {
        exerciseStackList.add(ExerciseData.fromJson(v));
      });
    }
  }
}

class ExerciseData {
  String exerciseName="";
  String startCommand = "";
  String endCommand = "";
  String exerciseMin = "";
  String exerciseSec = "";
  String exerciseStartTimeMin = "";
  String exerciseStartTimeSec = "";

  ExerciseData(
      {this.exerciseName = "",
      this.startCommand = "",
      this.endCommand = "",
      this.exerciseMin= "",
        this.exerciseSec= "",
        this.exerciseStartTimeMin= "",
        this.exerciseStartTimeSec= ""});

  ExerciseData.fromJson(Map<String, dynamic> json) {
    // exerciseName = json['customer_id'];
    // startCommand = json['firstname'];
    // endCommand = json['lastname'];
    // exerciseTime = json['email'];
  }
}
