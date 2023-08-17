import 'package:flutter/material.dart';
import 'package:tasks_menegers/auth/verify_email/verify_mail_controller.dart';
import 'package:tasks_menegers/style/style.dart';
import 'package:get/get.dart';


class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  VerifyMailController verifyMailController = Get.put(VerifyMailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
              alignment: Alignment.center,
              child: verifyMailController.verifyLoading
                  ? (const Center(child: CircularProgressIndicator()))
                  : (SingleChildScrollView(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your Email Address",
                              style: Head1Text(colorDarkBlue)),
                          const SizedBox(height: 1),
                          Text(
                              "A 6 digit verification pin will send to your email address",
                              style: Head6Text(colorLightGray)),
                          const SizedBox(height: 20),
                          TextFormField(
                            onChanged: (textValue) {
                              verifyMailController.InputOnChange(
                                  "email", textValue);
                            },
                            decoration: AppInputDecoration("Email Address"),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: AppButtonStyle(),
                            child: SuccessButtonChild('Next'),
                            onPressed: () {
                              verifyMailController.FormOnSubmit();
                            },
                          )
                        ],
                      ),
                    )))
        ],
      ),
    );
  }
}
