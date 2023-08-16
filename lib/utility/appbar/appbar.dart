
import 'package:tasks_menegers/utility/all_image/all_image.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tasks_menegers/api/service.dart';
import 'package:tasks_menegers/style/style.dart';



AppBar TaskAppBar(context,ProfileData){
  log(ProfileData['firstName']);

  var image=ProfileData['photo'];

  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
      margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            child: ClipOval(

               child:Image.memory(ShowBase64Image(DefaultProfilePic)),

              
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