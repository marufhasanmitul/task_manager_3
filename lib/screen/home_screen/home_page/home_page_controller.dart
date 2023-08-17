import 'package:get/get.dart';

import '../../../api/service.dart';
import '../../../utility/all_image/all_image.dart';
import '../../canceled/cancel.dart';
import '../../completed/complet.dart';
import '../../new_task/new_task.dart';
import '../../progress/progress.dart';

class HomePageController extends GetxController{
  int TabIndex=0;
  Map<String,String> ProfileData={"email":"","firstName":"","lastName":"","photo":DefaultProfilePic};

  onItemTapped(int index){

      TabIndex=index;
      update();
  }

  final widgetOptions=[
    newTaskList(),
    CompletedTaskList(),
    CancelTaskList(),
    progressTaskList(),
  ];


  ReadAppBarData() async {
    String? email= await ReadUserData('email');
    String? firstName= await ReadUserData('firstName');
    String? lastName= await ReadUserData('lastName');
    String? photo= await ReadUserData('photo');

      ProfileData={"email":'$email',"firstName":'$firstName',"lastName":'$lastName',"photo":'$photo'};
      update();
  }
}