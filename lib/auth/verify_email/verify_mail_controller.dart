import 'package:get/get.dart';
import 'package:tasks_menegers/auth/verify_email/verify_api_call.dart';
import '../../style/style.dart';

class VerifyMailController extends GetxController{
  Map<String,String> FormValues={"email":""};
  bool _loading=false;
  bool get verifyLoading=>_loading;

  InputOnChange(MapKey, Textvalue){
      FormValues.update(MapKey, (value) => Textvalue);
      update();
  }

  FormOnSubmit() async{
    if(FormValues['email']!.length==0){
      ErrorToast('Email Required !');
    }
    else{
      _loading=true;
      update();
      bool res=await VerifyEmailRequest(FormValues['email']);
      if(res==true){
        Get.toNamed("/pinVerification");
      }
      else{
          _loading=false;
          update();
      }
    }
  }

}