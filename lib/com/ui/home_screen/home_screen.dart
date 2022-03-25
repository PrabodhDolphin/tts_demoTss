import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tts_demo/com/model/exercise_model/exercise_model.dart';
import 'package:tts_demo/com/model/singleton_model/SingletonDataManager.dart';
import 'package:tts_demo/com/ui/timer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController startCommandController = TextEditingController();
  final TextEditingController exeNameController = TextEditingController();
  final TextEditingController exeMinuteController = TextEditingController();
  final TextEditingController exeSecController = TextEditingController();
  final TextEditingController endCommandController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    startCommandController.dispose();
    exeNameController.dispose();
    exeMinuteController.dispose();
    exeSecController.dispose();
    endCommandController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   title: const Text("Welcome"),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.red.withOpacity(0.2),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child: createYourExerciseList(),
        ),
      ),
    );
  }

  Widget createYourExerciseList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          //Exe name
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text("Exercise Name"),
              ),
              Flexible(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: const Border(
                      top: BorderSide(width: 0.5, color: Colors.white),
                      bottom: BorderSide(width: 0.5, color: Colors.white),
                      right: BorderSide(width: 0.5, color: Colors.white),
                      left: BorderSide(width: 0.5, color: Colors.white),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: exeNameController,
                            decoration: InputDecoration(
                              //isDense: true,
                              contentPadding:
                                  const EdgeInsets.all(0).copyWith(left: 10),
                              border: InputBorder.none,
                              hintText: "Enter Exercise Name",
                              hintStyle: const TextStyle(color: Colors.grey),

                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                                // color: Colors.grey,
                                fontSize: 13,
                                fontFamily: "Montserrat-Regular"),
                            //controller: titleController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),

//Duration
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: const Text("Exercise Duration"),
              ),
              Flexible(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: const Border(
                      top: BorderSide(width: 0.5, color: Colors.white),
                      bottom: BorderSide(width: 0.5, color: Colors.white),
                      right: BorderSide(width: 0.5, color: Colors.white),
                      left: BorderSide(width: 0.5, color: Colors.white),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: exeMinuteController,
                            decoration: InputDecoration(
                              //isDense: true,
                              contentPadding:
                                  EdgeInsets.all(0).copyWith(left: 10),
                              border: InputBorder.none,
                              hintText: "Minutes",
                              hintStyle: const TextStyle(color: Colors.grey),

                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                                // color: Colors.grey,
                                fontSize: 13,
                                fontFamily: "Montserrat-Regular"),
                            //controller: titleController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: const Border(
                      top: BorderSide(width: 0.5, color: Colors.white),
                      bottom: BorderSide(width: 0.5, color: Colors.white),
                      right: BorderSide(width: 0.5, color: Colors.white),
                      left: BorderSide(width: 0.5, color: Colors.white),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: exeSecController,
                            decoration: InputDecoration(
                              //isDense: true,
                              contentPadding:
                                  EdgeInsets.all(0).copyWith(left: 10),
                              border: InputBorder.none,
                              hintText: "Seconds",
                              hintStyle: const TextStyle(color: Colors.grey),

                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                                // color: Colors.grey,
                                fontSize: 13,
                                fontFamily: "Montserrat-Regular"),
                            //controller: titleController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          //Start Command
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: const Text("Start Command"),
              ),
              Flexible(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: const Border(
                      top: BorderSide(width: 0.5, color: Colors.white),
                      bottom: BorderSide(width: 0.5, color: Colors.white),
                      right: BorderSide(width: 0.5, color: Colors.white),
                      left: BorderSide(width: 0.5, color: Colors.white),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: startCommandController,
                            decoration: InputDecoration(
                              //isDense: true,
                              contentPadding:
                                  EdgeInsets.all(0).copyWith(left: 10),
                              border: InputBorder.none,
                              hintText: "Start Command",
                              hintStyle: const TextStyle(color: Colors.grey),

                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                                // color: Colors.grey,
                                fontSize: 13,
                                fontFamily: "Montserrat-Regular"),
                            //controller: titleController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          //End Command
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: const Text("End Command"),
              ),
              Flexible(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: const Border(
                      top: BorderSide(width: 0.5, color: Colors.white),
                      bottom: BorderSide(width: 0.5, color: Colors.white),
                      right: BorderSide(width: 0.5, color: Colors.white),
                      left: BorderSide(width: 0.5, color: Colors.white),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: endCommandController,
                            decoration: InputDecoration(
                              //isDense: true,
                              contentPadding:
                                  EdgeInsets.all(0).copyWith(left: 10),
                              border: InputBorder.none,
                              hintText: "End Command",
                              hintStyle: const TextStyle(color: Colors.grey),

                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                                // color: Colors.grey,
                                fontSize: 13,
                                fontFamily: "Montserrat-Regular"),
                            //controller: titleController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          // buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    addExeToList();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(44, 75 ,106, 1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text("Add to List")),
              ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    int exeMin = 0;
                    int exeSec = 0;
                    for (int i = 0;
                        i < SingletonDataManager.exeList.length;
                        i++) {
                      SingletonDataManager.exeList[i].exerciseStartTimeMin =
                          exeMin.toString();
                      SingletonDataManager.exeList[i].exerciseStartTimeSec =
                          exeSec.toString();

                      exeMin = exeMin +
                          int.parse(
                              SingletonDataManager.exeList[i].exerciseMin);
                      exeSec = exeSec +
                          int.parse(
                              SingletonDataManager.exeList[i].exerciseSec);
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TimerScreen(
                                exeMinutes: exeMin,
                                exeSeconds: exeSec,
                              )),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(44, 75 ,106, 1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text("Start Exe")),
              ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    clearExeList();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(44, 75 ,106, 1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text("Clear List")),
            ],
          ),

          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: SingletonDataManager.exeList.length,
            itemBuilder: (context, index) {
              return Container(
                //color: Colors.red,
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Container(
                      //color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Text(SingletonDataManager
                                  .exeList[index].exerciseName),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(SingletonDataManager
                                        .exeList[index].exerciseMin +
                                    ":" +
                                    SingletonDataManager
                                        .exeList[index].exerciseSec),
                              )),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: IconButton(
                                  onPressed: () {
                                    removeSelectedExe(index);
                                  },
                                  icon: const Icon(Icons.delete)),
                            ),
                          )
                        ],
                      ),
                    )

                    // Center(
                    //   child: Table(
                    //     border: TableBorder.all(color: Colors.black),
                    //     children: [
                    //       TableRow(
                    //
                    //           children: [
                    //         Text(
                    //             SingletonDataManager.exeList[index].exerciseName),
                    //         Text(
                    //             SingletonDataManager.exeList[index].exerciseTime),
                    //         IconButton(onPressed: () {
                    //           removeSelectedExe(index);
                    //         }, icon: const Icon(Icons.delete))
                    //       ]),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  addExeToList() {
    ExerciseData exeData = ExerciseData();
    exeData.exerciseName = exeNameController.text.isEmpty
        ? "Exercise " + (SingletonDataManager.exeList.length + 1).toString()
        : exeNameController.text;
    exeData.exerciseMin =
        exeMinuteController.text.isEmpty ? "0" : exeMinuteController.text;
    exeData.exerciseSec =
        exeSecController.text.isEmpty ? "0" : exeSecController.text;
    exeData.startCommand = startCommandController.text.isEmpty
        ? exeData.exerciseName + " Start"
        : startCommandController.text;
    exeData.endCommand = endCommandController.text.isEmpty
        ? exeData.exerciseName + " End"
        : endCommandController.text;
    setState(() {
      SingletonDataManager.exeList.add(exeData);
    });

    exeNameController.text = "";
    exeMinuteController.text = "";
    exeSecController.text = "";
    startCommandController.text = "";
    endCommandController.text = "";
  }

  removeSelectedExe(int exeIndex) {
    setState(() {
      SingletonDataManager.exeList.removeAt(exeIndex);
    });
  }

  clearExeList() {
    setState(() {
      SingletonDataManager.exeList = [];
    });
  }
}
