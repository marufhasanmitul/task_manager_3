import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tasks_menegers/auth/singin/singin.dart';
import 'package:tasks_menegers/auth/verify_pin/pin_verify_controller.dart';
import 'package:tasks_menegers/style/style.dart';
import 'package:get/get.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  PinVerifyController pinVerifyController = Get.put(PinVerifyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: pinVerifyController.pinLoading
                ? (const Center(child: CircularProgressIndicator()))
                : (SingleChildScrollView(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("PIN Verification",
                            style: Head1Text(colorDarkBlue)),
                        const SizedBox(height: 10),
                        Text(
                            "A 6 digit pin has been send to your email address",
                            style: Head6Text(colorLightGray)),
                        const SizedBox(height: 20),
                        PinCodeTextField(
                            appContext: context,
                            length: 6,
                            pinTheme: AppOTPStyle(),
                            animationType: AnimationType.fade,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            enableActiveFill: true,
                            onCompleted: (v) {},
                            onChanged: (value) {
                              pinVerifyController.InputOnChange("otp", value);
                            }),
                        ElevatedButton(
                          style: AppButtonStyle(),
                          child: SuccessButtonChild('Verify'),
                          onPressed: () {
                            pinVerifyController.FormOnSubmit();
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                                text: 'Have account?',
                                style: Head6Text(colorLightGray),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Sign In',
                                      style: Head6Text(colorGreen),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      LoginScreen()));
                                        }),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  )),
          )
        ],
      ),
    );
  }
}
