import 'package:get/get.dart';
import 'package:tasks_menegers/auth/singup/signup_api_call.dart';

import '../../style/style.dart';

class SignUpController extends GetxController {
  Map<String, String> FormValues = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "mobile": "",
    "password": "",
    "photo": "",
    "cpassword": ""
  };
  bool _loading = false;

  bool get signUpLoading => _loading;

  InputOnChange(MapKey, Textvalue) {
    FormValues.update(MapKey, (value) => Textvalue);
    update();
  }

  FormOnSubmit() async {
    if (FormValues['email']!.isEmpty) {
      ErrorToast('Email Required !');
    } else if (FormValues['firstName']!.isEmpty) {
      ErrorToast('First Name Required !');
    } else if (FormValues['lastName']!.isEmpty) {
      ErrorToast('Last Name Required !');
    } else if (FormValues['mobile']!.isEmpty) {
      ErrorToast('Mobile No Required !');
    } else if (FormValues['password']!.isEmpty) {
      ErrorToast('Mobile No Required !');
    } else if (FormValues['password'] != FormValues['cpassword']) {
      ErrorToast('Confirm password should be same!');
    } else {
      _loading = true;
      update();
      bool res = await RegistrationRequest(FormValues);
      if (res == true) {
        Get.offAndToNamed("/login");
      } else {
        _loading = false;
        update();
      }
    }
  }
}
