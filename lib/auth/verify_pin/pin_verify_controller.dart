import 'package:get/get.dart';
import 'package:tasks_menegers/auth/verify_pin/pin_verify_api_call.dart';

import '../../api/apiClient.dart';
import '../../api/service.dart';
import '../../style/style.dart';

class PinVerifyController extends GetxController{

  Map<String,String> FormValues={"otp":""};
  bool _loading=false;
  bool get pinLoading=>_loading;

  InputOnChange(MapKey, Textvalue){
      FormValues.update(MapKey, (value) => Textvalue);
      update();
  }

  FormOnSubmit() async{
    if(FormValues['otp']!.length!=6){
      ErrorToast('PIN Required !');
    }
    else{
      _loading=true;
      update();
      String? emailAddress=await ReadUserData('EmailVerification');
      bool res=await VerifyOTPRequest(emailAddress,FormValues['otp']);
      if(res==true){
        Get.toNamed("/setPassword");
      }
      else{
        _loading=false;
        update();
      }
    }
  }

}