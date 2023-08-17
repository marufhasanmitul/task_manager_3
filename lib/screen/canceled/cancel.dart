import 'package:flutter/material.dart';
import 'package:tasks_menegers/api/apiClient.dart';
import 'package:tasks_menegers/screen/canceled/cancel_controller.dart';
import 'package:tasks_menegers/screen/task_list/task_lists.dart';
import 'package:tasks_menegers/style/style.dart';
import 'package:get/get.dart';


class CancelTaskList extends StatefulWidget {
  const CancelTaskList({Key? key}) : super(key: key);
  @override
  State<CancelTaskList> createState() => _CancelTaskListState();
}

class _CancelTaskListState extends State<CancelTaskList> {
  CancelController cancelController=Get.put(CancelController());

  @override
  void initState(){
    cancelController.CallData();
    super.initState();
  }

  DeleteItem(id) async{
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Delete !"),
            content: const Text("Onece delete, you can't get it back"),
            actions: [
              OutlinedButton(onPressed: () async {
                Navigator.pop(context);
                setState(() {cancelController.cancelLoading==true;});
                await TaskDeleteRequest(id);
                await cancelController.CallData();
              }, child: const Text('Yes')),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text('No')),
            ],
          );
        }
    );
  }

  StatusChange(id) async{
    showModalBottomSheet(context: context,
        builder: (context){
          return StatefulBuilder(
              builder: (BuildContext context,StateSetter setState){
                return Container(
                  padding: const EdgeInsets.all(30),
                  height: 360,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RadioListTile(title: const Text("New"), value: "New", groupValue: cancelController.Status,
                        onChanged: (value){
                          setState(() {
                            cancelController.Status = value.toString();
                          });
                        },
                      ),
                      RadioListTile(title: const Text("Progress"), value: "Progress", groupValue: cancelController.Status,
                        onChanged: (value){
                          setState(() {
                            cancelController.Status = value.toString();
                          });
                        },
                      ),
                      RadioListTile(title: const Text("Completed"), value: "Completed", groupValue: cancelController.Status,
                        onChanged: (value){
                          setState(() {
                            cancelController.Status = value.toString();
                          });
                        },
                      ),
                      RadioListTile(title: const Text("Canceled"), value: "Canceled", groupValue: cancelController.Status,
                        onChanged: (value){
                          setState(() {
                            cancelController.Status = value.toString();
                          });
                        },
                      ),
                      ElevatedButton(
                        style: AppButtonStyle(),
                        child: SuccessButtonChild('Confirm'),
                        onPressed: (){
                          Get.back();
                          cancelController.UpdateStatus(id);
                        },
                      ),
                    ],
                  ),
                );
              }
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return cancelController.cancelLoading?(const Center(child: CircularProgressIndicator())):RefreshIndicator(
        onRefresh: () async {
          await cancelController.CallData();
        },
        child: TaskList(cancelController.TaskItems,DeleteItem,StatusChange)
    );
  }
}