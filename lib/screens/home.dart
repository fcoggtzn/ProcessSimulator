
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:os_simulator/controllers/process_controller.dart';

import 'about.dart';

class Home extends StatelessWidget {
  final controller = Get.put(ProcessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: Center(
        child:
            GetBuilder<ProcessController>(
              builder: (_) => ListView.builder(
                  scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8),
                itemCount: _.entries.length,
                itemBuilder: (BuildContext context, int index) {
                return Container(
                height: 50,
                color: _.entries[index].status?.color??const Color.fromRGBO(255, 255, 255, 1),
                child: Row(children:[  Text('PID: ${_.entries[index].pid} | Status   ${_.entries[index].status?.displayTitle} | remain time:  ${_.entries[index].remainTime}')]),
                );
                }
                )

            ),




        ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>controller.increment(),
      ),
    );
  }


}