import 'package:get/get.dart';

import '../../api/apiClient.dart';

class CancelController extends GetxController{
  List TaskItems=[];
  bool _loading=true;
  bool get cancelLoading=>_loading;
  String Status="Canceled";

  CallData() async{
    var data= await TaskListRequest("Canceled");
      _loading=false;
      TaskItems=data;
      update();

  }

  UpdateStatus(id) async{
    _loading=true;
    update();
    await TaskUpdateRequest(id,Status);
    await CallData();
    Status = "Canceled";
    update();
  }

}
