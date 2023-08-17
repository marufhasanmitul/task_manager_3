import 'package:flutter/material.dart';
import 'package:tasks_menegers/screen/home_screen/new_task_list/task_create_controller.dart';

import 'package:tasks_menegers/style/style.dart';
import 'package:get/get.dart';

import '../../../api/apiClient.dart';

class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({Key? key}) : super(key: key);

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {

  TaskCreateController taskCreateController=Get.put(TaskCreateController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: colorGreen, title: Text('Create New Task')),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: taskCreateController.taskCreateLoading?(const Center(child: CircularProgressIndicator())):(SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add New Task", style: Head1Text(colorDarkBlue)),
                  const SizedBox(height: 1),
                  TextFormField(
                    onChanged: (Textvalue){
                      taskCreateController.InputOnChange("title",Textvalue);
                    },
                    decoration: AppInputDecoration("Subject"),

                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    onChanged: (Textvalue){
                      taskCreateController.InputOnChange("description",Textvalue);
                    },
                    maxLines: 10,
                    decoration: AppInputDecoration("Description"),
                  ),

                  const SizedBox(height: 20),


                  GetBuilder<TaskCreateController>(
                    builder: (taskCreateController) {
                      return Visibility(
                        visible: taskCreateController.taskCreateLoading==false,
                        replacement: const Center(child: CircularProgressIndicator(),),
                        child: ElevatedButton(
                          style: AppButtonStyle(),
                          child: SuccessButtonChild('Create'),
                          onPressed: (){
                            taskCreateController.FormOnSubmit();
                          },
                        ),
                      );
                    },

                  ),
                ],
              ),
            )),
          )
        ],
      ),

    );
  }
}