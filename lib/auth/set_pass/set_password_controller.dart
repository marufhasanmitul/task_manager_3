import 'package:get/get.dart';
import 'package:tasks_menegers/auth/set_pass/set_password_api.dart';
import '../../api/service.dart';
import '../../style/style.dart';


class SetPasswordController extends GetxController{
  Map<String,String> formValues={"email":"", "OTP":"","password":"","cpassword":""};
  bool _loading=false;
  bool get setPasswordProgress => _loading;



  callStoreData() async {
    String? OTP= await ReadUserData("OTPVerification");
    String? Email= await ReadUserData("EmailVerification");
    inputOnChange("email", Email);
    inputOnChange("OTP", OTP);
  }

  inputOnChange(mapKey, textValue){
      formValues.update(mapKey, (value) => textValue);
      update();
  }

  formOnSubmit() async{
    if(formValues['password']!.isEmpty){
      ErrorToast('Password Required !');
    }
    else if(formValues['password']!=formValues['cpassword']){
      ErrorToast('Confirm password should be same!');
    }
    else{
      _loading=true;
      update();
      bool res=await SetPasswordRequest(formValues);
      if(res==true){
        Get.offAllNamed("/login");
      }
      else{
       _loading=false;
       update();
      }
    }
  }


}