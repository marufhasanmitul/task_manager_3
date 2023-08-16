import 'package:flutter/material.dart';
import 'package:tasks_menegers/auth/singin/sign_in_controller.dart';
import 'package:tasks_menegers/style/style.dart';
import 'package:get/get.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final SignInController signInController = Get.put(SignInController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: signInController.loginProgress?(const Center(child: CircularProgressIndicator())):(SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Get Started With", style: Head1Text(colorDarkBlue)),


                  const SizedBox(height: 20),

                  TextFormField(
                    onChanged: (textValue){
                      signInController.inputOnChange("email",textValue);
                    },
                    decoration: AppInputDecoration("Email Address"),
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    onChanged: (textValue){
                      signInController.inputOnChange("password",textValue);
                    },
                    decoration: AppInputDecoration("Password"),
                  ),

                  const SizedBox(height: 20),


                  GetBuilder<SignInController>(
                    builder: (signInController) {
                      return Visibility(
                        visible:signInController.loginProgress==false,
                        replacement:const Center(child: CircularProgressIndicator()) ,
                        child: ElevatedButton(
                          style: AppButtonStyle(),
                          child: SuccessButtonChild('Login'),
                          onPressed: (){
                            signInController.formOnSubmit();
                          },
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),


                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        InkWell(
                            onTap: (){
                              Get.toNamed('/emailVerification');
                            },
                            child: Text('Forget Password?',style: Head7Text(colorLightGray),
                            )
                        ),

                        const SizedBox(height: 15),

                        InkWell(
                            onTap: (){
                              Get.toNamed('/registration');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have a account? ",style: Head7Text(colorDarkBlue)),
                                Text("Sign Up",style: Head7Text(colorGreen),)
                              ],
                            )
                        )
                      ],
                    ),
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