import 'package:get/get.dart';

import '../../style/style.dart';
import 'sign_in_api_call.dart';


class SignInController extends GetxController{
  Map<String,String> formValues={"email":"", "password":""};
  bool _loading=false;
  bool get loginProgress => _loading;

  inputOnChange(MapKey, textValue){
      formValues.update(MapKey, (value) => textValue);
      update();

  }

  formOnSubmit() async{
    if(formValues['email']!.isEmpty){
      ErrorToast('Email Required !');
    }
    else if(formValues['password']!.isEmpty){
      ErrorToast('Password Required !');
    }
    else{
      _loading=true;
      update();
      bool res=await loginRequest(formValues);
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