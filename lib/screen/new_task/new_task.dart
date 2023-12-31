import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasks_menegers/api/apiClient.dart';
import 'package:tasks_menegers/screen/task_list/task_lists.dart';
import 'package:tasks_menegers/style/style.dart';



class newTaskList extends StatefulWidget {
  const newTaskList({Key? key}) : super(key: key);

  @override
  State<newTaskList> createState() => _newTaskListState();
}

class _newTaskListState extends State<newTaskList> {
  List TaskItems=[];
  List CountData=[];
  bool Loading=true;
  String Status="New";

  @override
  void initState(){
    CallData();
    MyCountData();
    super.initState();
  }



  CallData() async{
    var data= await TaskListRequest("New");
    setState(() {
      Loading=false;
      TaskItems=data;
    });
    log(TaskItems.toString());
  }


  MyCountData()async{
    var countData=await  TaskStatusCount();
    setState(() {
      CountData=countData;
    });

    log(CountData.toString());
  }



  UpdateStatus(id) async{
    setState(() {Loading=true;});
    await TaskUpdateRequest(id,Status);
    await CallData();
    setState(() {Status = "New";});
  }


  DeleteItem(id) async{
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Delete !"),
            content: Text("Onece delete, you can't get it back"),
            actions: [
              OutlinedButton(onPressed: () async {
                Navigator.pop(context);
                setState(() {Loading=true;});
                await TaskDeleteRequest(id);
                await CallData();
              }, child: Text('Yes')),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('No')),
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
                  padding: EdgeInsets.all(30),
                  height: 360,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RadioListTile(title: Text("New"), value: "New", groupValue: Status,
                        onChanged: (value){
                          setState(() {
                            Status = value.toString();
                          });
                        },
                      ),
                      RadioListTile(title: Text("Progress"), value: "Progress", groupValue: Status,
                        onChanged: (value){
                          setState(() {
                            Status = value.toString();
                          });
                        },
                      ),
                      RadioListTile(title: Text("Completed"), value: "Completed", groupValue: Status,
                        onChanged: (value){
                          setState(() {
                            Status = value.toString();
                          });
                        },
                      ),
                      RadioListTile(title: Text("Canceled"), value: "Canceled", groupValue: Status,
                        onChanged: (value){
                          setState(() {
                            Status = value.toString();
                          });
                        },
                      ),
                      Container(child: ElevatedButton(
                        style: AppButtonStyle(),
                        child: SuccessButtonChild('Confirm'),
                        onPressed: (){
                          Navigator.pop(context);
                          UpdateStatus(id);
                        },
                      ),)
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
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green.shade400,
          onPressed: () {
            Navigator.pushNamed(context, "/taskCreate");

          },
        child: Icon(Icons.add,color: Colors.white,size: 30,),
        ),
      body:Column(
        children: [
          SizedBox(
            height: 90,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: CountData.length,
                itemBuilder: (context,index){
                  return SizedBox(
                    width: 90,
                    height: 80,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [


                            Text("${CountData[index]['sum']}"),
                            SizedBox(height: 10,),
                            Text("${CountData[index]['_id']}"),
                          ],
                        ),
                      ),
                    ),
                  );
                }

            ),
          ),
          Expanded(
            child: Loading?(Center(child: CircularProgressIndicator())):RefreshIndicator(
                onRefresh: () async {
                  await CallData();
                },
                child: TaskList(TaskItems,DeleteItem,StatusChange)
            ),
          ),
        ],
      )



    );
  }
}