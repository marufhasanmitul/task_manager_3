import 'package:flutter/material.dart';
import 'package:tasks_menegers/auth/set_pass/set_password_controller.dart';
import 'package:tasks_menegers/style/style.dart';
import 'package:get/get.dart';


class SetPasswordScreen extends StatefulWidget {

  const SetPasswordScreen({Key? key}) : super(key: key);
  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();

}


class _SetPasswordScreenState extends State<SetPasswordScreen> {

  final SetPasswordController setPasswordController = Get.put(SetPasswordController());


  @override
  initState() {
    setPasswordController.callStoreData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: setPasswordController.setPasswordProgress?(const Center(child: CircularProgressIndicator())):(SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Set Password", style: Head1Text(colorDarkBlue)),
                  const SizedBox(height: 1),
                  Text("Minimum length password 8 character with Latter and number combination ", style: Head7Text(colorLightGray)),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (textValue){
                      setPasswordController.inputOnChange("password",textValue);
                    },
                    decoration: AppInputDecoration("Password"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (textValue){
                      setPasswordController.inputOnChange("cpassword",textValue);
                    },
                    decoration: AppInputDecoration("Confirm Password"),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild('Confirm'),
                    onPressed: (){
                      setPasswordController.formOnSubmit();
                    },
                  )
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}