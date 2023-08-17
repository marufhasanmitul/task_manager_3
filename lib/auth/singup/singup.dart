import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks_menegers/auth/singup/signup_controller.dart';
import 'package:tasks_menegers/style/style.dart';
import '../../api/apiClient.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final SignUpController signUpController = Get.put(SignUpController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child:signUpController.signUpLoading?(Center(child: CircularProgressIndicator())):(
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Join With Us", style: Head1Text(colorDarkBlue)),

                          const SizedBox(height: 20),
                          TextFormField(
                              decoration: AppInputDecoration("Email Address"),
                              onChanged: (textValue){
                                signUpController.InputOnChange("email",textValue);
                              }
                          ),

                          const SizedBox(height: 20),
                          TextFormField(
                              decoration: AppInputDecoration("First Name"),
                              onChanged: (textValue){
                                signUpController.InputOnChange("firstName",textValue);
                              }
                          ),

                          const SizedBox(height: 20),
                          TextFormField(
                              decoration: AppInputDecoration("Last Name"),
                              onChanged: (textValue){
                                signUpController.InputOnChange("lastName",textValue);
                              }
                          ),

                          const SizedBox(height: 20),
                          TextFormField(
                              decoration: AppInputDecoration("Mobile"),
                              onChanged: (textValue){
                                signUpController.InputOnChange("mobile",textValue);
                              }
                          ),

                          const SizedBox(height: 20),
                          TextFormField(
                              decoration: AppInputDecoration("Password"),
                              onChanged: (textValue){
                                signUpController.InputOnChange("password",textValue);
                              }
                          ),


                          const SizedBox(height: 20),
                          TextFormField(
                              decoration: AppInputDecoration("Confirm Password"),
                              onChanged: (textValue){
                                signUpController.InputOnChange("cpassword",textValue);
                              }
                          ),

                          const SizedBox(height: 20),
                          GetBuilder<SignUpController>(
                            builder: (signUpController) {
                              return Visibility(
                                replacement:const Center(child: CircularProgressIndicator()),
                                visible: signUpController.signUpLoading==false,
                                child: ElevatedButton(
                                  style: AppButtonStyle(),
                                  child: SuccessButtonChild('Registration'),
                                  onPressed: (){
                                    signUpController.FormOnSubmit();
                                  },
                                ),
                              );
                            },
                          )

                        ],
                      ),
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}