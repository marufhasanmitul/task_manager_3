import 'package:flutter/material.dart';

import 'package:tasks_menegers/api/service.dart';
import 'package:tasks_menegers/utility/text_style/text_style.dart';

AppBar TaskAppBar(context,ProfileData){
  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
      margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            child: ClipOval(

              // child: Image.memory(ShowBase64Image(ProfileData['photo'])),
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${ProfileData['firstName']} ${ProfileData['lastName']}',style: Head7Text(colorWhite),),
              Text(ProfileData['email'],style: Head9Text(colorWhite),)
            ],
          )
        ],
      ),
    ),
    actions: [

      IconButton(
          onPressed: () async {
            await RemoveToken();
            Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);

          },
          icon: Icon(Icons.output)
      )
    ],

  );
}