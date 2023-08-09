
import 'package:flutter/material.dart';
import 'package:tasks_menegers/api/service.dart';
import 'package:tasks_menegers/auth/set_pass/set_pass.dart';
import 'package:tasks_menegers/auth/singin/singin.dart';
import 'package:tasks_menegers/auth/singup/singup.dart';
import 'package:tasks_menegers/auth/verify_email/verify_email.dart';
import 'package:tasks_menegers/auth/verify_pin/verify_pin.dart';
import 'package:tasks_menegers/screen/home_screen/home_page.dart';

import 'package:tasks_menegers/screen/home_screen/new_task_list.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token= await ReadUserData('token');
  if(token==null){
    runApp( MyApp("/login"));
  }
  else{
    runApp( MyApp("/"));
  }
}

class MyApp extends StatelessWidget {
  final String FirstRoute;
  MyApp(this.FirstRoute);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      initialRoute: FirstRoute,
      routes: {
        '/':(context)=> homeScreen(),
        '/login':(context)=> loginScreen(),
        '/registration':(context)=> registrationScreen(),
        '/emailVerification':(context)=> emailVerificationScreen(),
        '/pinVerification':(context)=> pinVerificationScreen(),
        '/setPassword':(context)=> setPasswordScreen(),
        '/taskCreate':(context)=> taskCreateScreen()
      },
    );
  }
}