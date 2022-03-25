import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:simple_timer/simple_timer.dart';
import 'package:tts_demo/com/model/singleton_model/SingletonDataManager.dart';

class TimerScreen extends StatefulWidget {
  final int exeMinutes;
  final int exeSeconds;

  const TimerScreen({Key? key, this.exeMinutes = 0, this.exeSeconds = 0})
      : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

enum TtsState { playing, stopped, paused, continued }

class _TimerScreenState extends State<TimerScreen>
    with SingleTickerProviderStateMixin {
  TimerController? _timerController;
  final TimerStyle _timerStyle = TimerStyle.ring;

  final TimerProgressIndicatorDirection _progressIndicatorDirection =
      TimerProgressIndicatorDirection.clockwise;
  final TimerProgressTextCountDirection _progressTextCountDirection =
      TimerProgressTextCountDirection.count_down;

  late Duration exeDuration; // = Duration(seconds: widget.exeSeconds);

  late FlutterTts flutterTts;
  String? language;
  String? engine;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;
  TtsState ttsState = TtsState.stopped;

  String? _newVoiceText;
  int? _inputLength;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  get isPaused => ttsState == TtsState.paused;

  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;

  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  bool get isWeb => kIsWeb;

  @override
  void initState() {
    // TODO: implement initState
    exeDuration =
        Duration(minutes: widget.exeMinutes, seconds: widget.exeSeconds);
    _timerController = TimerController(this);
    super.initState();
    initTts();
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   title: const Text("Timer"),
      //   leading: IconButton(
      //       icon: const Icon(Icons.arrow_back, color: Colors.black),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       }),
      // ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Container(
            width: 300,
            height: 300,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: SimpleTimer(
              duration: exeDuration,
              //duration: Duration(minutes: int.parse(exeMinuteController.text), seconds: int.parse(exeSecController.text)),
              controller: _timerController,
              timerStyle: _timerStyle,
              onStart: handleTimerOnStart,
              onEnd: handleTimerOnEnd,
              valueListener: timerValueChangeListener,
              backgroundColor: Colors.grey,
              progressIndicatorColor: Colors.green,
              progressIndicatorDirection: _progressIndicatorDirection,
              progressTextCountDirection: _progressTextCountDirection,
              progressTextStyle: const TextStyle(color: Colors.black),
              strokeWidth: 10,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _timerController!.start();
                  },
                  child: Text("Start")),
              ElevatedButton(
                  onPressed: () {
                    _timerController!.pause();
                  },
                  child: Text("Pause")),
              ElevatedButton(
                  onPressed: () {
                    _timerController!.stop();
                    _timerController!.reset();
                  },
                  child: Text("Stop")),
            ],
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: SingletonDataManager.exeList.length,
            itemBuilder: (context, index) {
              return Container(
                color: ((exeindex - 1) == index) ? Colors.red : Colors.white,
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
                                    // removeSelectedExe(index);
                                  },
                                  icon: const Icon(Icons.delete)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void handleTimerOnStart() {
    print("timer has just started");
  }

  void handleTimerOnEnd() {
    print("timer has ended");
  }

  int exeindex = 0;

  void timerValueChangeListener(Duration timeElapsed) {

    if(exeindex>=SingletonDataManager.exeList.length){
      return;
    }



    Duration dd = Duration(
        minutes: int.parse(
            SingletonDataManager.exeList[exeindex].exerciseStartTimeMin),
        seconds: int.parse(
            SingletonDataManager.exeList[exeindex].exerciseStartTimeSec));

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(timeElapsed.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(timeElapsed.inSeconds.remainder(60));

    Duration dd1 = Duration(
        minutes: int.parse(twoDigitMinutes),
        seconds: int.parse(twoDigitSeconds));

    if (dd1.compareTo(dd) > 0) {
      setState(() {
        _newVoiceText = SingletonDataManager.exeList[exeindex].startCommand;
        _speak();
        exeindex++;
      });
    }

    //print(SingletonDataManager.exeList[exeindex - 1].exerciseName);

    // print(dd1.compareTo(dd).toString());
    //
    // print("001 :"+dd.toString());
    // print("002 :"+dd1.toString());

    //print("${twoDigits(timeElapsed.inHours)}:$twoDigitMinutes:$twoDigitSeconds");

    //print("$twoDigitMinutes:$twoDigitSeconds");

    // print(timeElapsed.abs().toString());
    //print("timerValueChangeListener "+timeElapsed.abs().inMinutes.toString() +" : "+timeElapsed.abs().inSeconds.toString());
  }

  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        print("Cancel");
        ttsState = TtsState.stopped;
      });
    });

    if (isWeb || isIOS) {
      flutterTts.setPauseHandler(() {
        setState(() {
          print("Paused");
          ttsState = TtsState.paused;
        });
      });

      flutterTts.setContinueHandler(() {
        setState(() {
          print("Continued");
          ttsState = TtsState.continued;
        });
      });
    }

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future<dynamic> _getLanguages() => flutterTts.getLanguages;

  Future<dynamic> _getEngines() => flutterTts.getEngines;

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future _speak() async {
    await flutterTts.setVolume(1);
    // await flutterTts.setSpeechRate(rate);
    //await flutterTts.setPitch(pitch);

    if (_newVoiceText != null) {
      if (_newVoiceText!.isNotEmpty) {
        await flutterTts.speak(_newVoiceText!);
      }
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _pause() async {
    var result = await flutterTts.pause();
    if (result == 1) setState(() => ttsState = TtsState.paused);
  }
}
