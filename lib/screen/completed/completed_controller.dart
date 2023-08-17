import 'package:get/get.dart';

import '../../api/apiClient.dart';

class CompletedController extends GetxController{
  List TaskItems=[];
  bool _loading=true;
  bool get completedLoading=>_loading;
  String Status="Completed";

  CallData() async{
    var data= await TaskListRequest("Completed");
      _loading=false;
      TaskItems=data;
      update();

  }

}