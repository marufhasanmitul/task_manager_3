import 'package:flutter/material.dart';
import 'package:tasks_menegers/api/apiClient.dart';
import 'package:tasks_menegers/screen/completed/completed_controller.dart';
import 'package:tasks_menegers/screen/task_list/task_lists.dart';
import 'package:tasks_menegers/style/style.dart';
import 'package:get/get.dart';



class CompletedTaskList extends StatefulWidget {
  const CompletedTaskList({Key? key}) : super(key: key);

  @override
  State<CompletedTaskList> createState() => _CompletedTaskListState();
}

class _CompletedTaskListState extends State<CompletedTaskList> {

  CompletedController completedController=Get.put(CompletedController());

  @override
  void initState(){
    completedController.CallData();
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
                setState(() {completedController.completedLoading==true;});
                await TaskDeleteRequest(id);
                await completedController.CallData();
              }, child: const Text('Yes')),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text('No')),
            ],
          );
        }
    );
  }



  UpdateStatus(id) async{
    setState(() {completedController.completedLoading==true;});
    await TaskUpdateRequest(id,completedController.Status);
    await completedController.CallData();
    setState(() {completedController.Status = "Completed";});
  }


  StatusChange(id) async{
    showModalBottomSheet(context: context,
        builder: (context){
          return StatefulBuilder(
              builder: (BuildContext context,StateSetter setState){
                return Container(
                  padding: EdgeInsets.all(30),
                  height: 360,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RadioListTile(title: Text("New"), value: "New", groupValue: completedController.Status,
                        onChanged: (value){
                          setState(() {
                            completedController.Status = value.toString();
                          });
                        },
                      ),
                      RadioListTile(title: Text("Progress"), value: "Progress", groupValue: completedController.Status,
                        onChanged: (value){
                          setState(() {
                            completedController.Status = value.toString();
                          });
                        },
                      ),
                      RadioListTile(title: Text("Completed"), value: "Completed", groupValue: completedController.Status,
                        onChanged: (value){
                          setState(() {
                            completedController.Status = value.toString();
                          });
                        },
                      ),
                      RadioListTile(title: Text("Canceled"), value: "Canceled", groupValue: completedController.Status,
                        onChanged: (value){
                          setState(() {
                            completedController.Status = value.toString();
                          });
                        },
                      ),
                      ElevatedButton(
                        style: AppButtonStyle(),
                        child: SuccessButtonChild('Confirm'),
                        onPressed: (){
                          Navigator.pop(context);
                          UpdateStatus(id);
                        },
                      )
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
    return completedController.completedLoading?(const Center(child: CircularProgressIndicator())):RefreshIndicator(
        onRefresh: () async {
          await completedController.CallData();
        },
        child: TaskList(completedController.TaskItems,DeleteItem,StatusChange)
    );
  }
}