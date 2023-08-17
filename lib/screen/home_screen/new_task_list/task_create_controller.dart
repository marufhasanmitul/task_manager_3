import 'package:get/get.dart';
import 'package:tasks_menegers/screen/home_screen/new_task_list/taskcreate_api.dart';
import '../../../style/style.dart';

class TaskCreateController extends GetxController{
  Map<String,String> FormValues={"title":"", "description":"","status":"New"};
  bool _loading=false;
  bool get taskCreateLoading=>_loading;

  InputOnChange(MapKey, Textvalue){

      FormValues.update(MapKey, (value) => Textvalue);
      update();
  }

  FormOnSubmit() async{
    if(FormValues['title']!.isEmpty){
      ErrorToast('Title Required !');
    }
    else if(FormValues['description']!.isEmpty){
      ErrorToast('Description Required !');
    }
    else{
      _loading=true;
      update();
      bool res=await TaskCreateRequest(FormValues);
      if(res==true){
        Get.offAndToNamed("/");
      }
      else{
        _loading=false;
         update();
      }
    }
  }


}