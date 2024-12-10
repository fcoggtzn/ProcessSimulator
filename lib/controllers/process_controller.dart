import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum ProcessStatus{
   ready,
   running,
   block,
}
extension ProcessStatusrExtension on ProcessStatus {
  String get displayTitle {
    switch (this) {
      case ProcessStatus.ready:
        return 'Ready';
      case ProcessStatus.running:
        return 'Running';
      case ProcessStatus.block:
        return 'Block';
    }
  }
  Color get color {
    switch (this) {
      case ProcessStatus.ready:
        return Color.fromRGBO(255, 255, 0, .5);
      case ProcessStatus.running:
        return Color.fromRGBO(173,255,47, .5);
      case ProcessStatus.block:
        return Color.fromRGBO(255, 0, 0, .5);
    }
  }
}

class ProcessID {
  int? pid = 0;
  ProcessStatus? status = ProcessStatus.ready;
  int? remainTime = 100;

  /// ndeed more data
  ProcessID({this.pid, this.status, this.remainTime});

}

class ProcessController extends GetxController {
  final List<ProcessID> entries = <ProcessID>[];
   int runningProcess = 0;
  Timer? _timers;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _timers?.cancel();
    super.onClose();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    startTimer();
    super.onReady();
  }



  void startTimer() {
  const oneSec = const Duration(seconds: 3);
  _timers = new Timer.periodic(
  oneSec,
  (Timer timer) {
    Random random =  Random();
    entries[runningProcess].status = ProcessStatus.ready;
    runningProcess = random.nextInt(entries.length);
    entries[runningProcess].status = ProcessStatus.running;
    update();
  });
  }





  void increment() {
    Random random =  Random();
    int maxPid =1000;
    int maxRemainTime =10000;
     entries.add(ProcessID( pid:random.nextInt(maxPid),status: ProcessStatus.ready,remainTime: random.nextInt(maxRemainTime)));
    update();
  }
}