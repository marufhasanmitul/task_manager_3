import 'package:flutter/material.dart';
import 'package:tasks_menegers/api/service.dart';
import 'package:tasks_menegers/screen/bottom_navbar/bottom_navbar.dart';
import 'package:tasks_menegers/screen/canceled/cancel.dart';
import 'package:tasks_menegers/screen/completed/complet.dart';
import 'package:tasks_menegers/screen/new_task/new_task.dart';
import 'package:tasks_menegers/screen/progress/progress.dart';
import 'package:tasks_menegers/utility/appbar/appbar.dart';

import '../../utility/all_image/all_image.dart';



class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  int TabIndex=0;
  Map<String,String> ProfileData={"email":"","firstName":"","lastName":"","photo":DefaultProfilePic};

  onItemTapped(int index){
    setState(() {
      TabIndex=index;
    });
  }

  final widgetOptions=[
    newTaskList(),
    completedTaskList(),
    cancelTaskList(),
    progressTaskList(),
  ];


  ReadAppBarData() async {
    String? email= await ReadUserData('email');
    String? firstName= await ReadUserData('firstName');
    String? lastName= await ReadUserData('lastName');
    String? photo= await ReadUserData('photo');
    setState(() {
      ProfileData={"email":'$email',"firstName":'$firstName',"lastName":'$lastName',"photo":'$photo'};
    });
  }

  @override
  void initState() {
    ReadAppBarData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskAppBar(context,ProfileData),
      body: widgetOptions.elementAt(TabIndex),
      bottomNavigationBar: appBottomNav(TabIndex,onItemTapped),
    );
  }
}