
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tasks_menegers/api/service.dart';
import 'package:tasks_menegers/auth/set_pass/set_pass.dart';
import 'package:tasks_menegers/auth/singin/singin.dart';
import 'package:tasks_menegers/auth/singup/singup.dart';
import 'package:tasks_menegers/auth/verify_email/verify_email.dart';
import 'package:tasks_menegers/auth/verify_pin/verify_pin.dart';
import 'package:tasks_menegers/screen/home_screen/home_page.dart';
import 'package:get/get.dart';

import 'package:tasks_menegers/screen/home_screen/new_task_list.dart';



main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token= await ReadUserData('token');
  if(token==null){
    runApp( const MyApp("/login"));
  }
  else{
    runApp( const MyApp("/"));
  }
}

class MyApp extends StatelessWidget {
  final String firstRoute;
  const MyApp(this.firstRoute, {super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      initialRoute: firstRoute,
      routes: {
        '/':(context)=> const homeScreen(),
        '/login':(context)=> const LoginScreen(),
        '/registration':(context)=> const registrationScreen(),
        '/emailVerification':(context)=> const emailVerificationScreen(),
        '/pinVerification':(context)=> const pinVerificationScreen(),
        '/setPassword':(context)=> const SetPasswordScreen(),
        '/taskCreate':(context)=> const taskCreateScreen()
      },
    );
  }
}

