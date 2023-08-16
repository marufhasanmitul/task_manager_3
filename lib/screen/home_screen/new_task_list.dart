import 'package:flutter/material.dart';

import 'package:tasks_menegers/style/style.dart';

import '../../api/apiClient.dart';

class taskCreateScreen extends StatefulWidget {
  const taskCreateScreen({Key? key}) : super(key: key);

  @override
  State<taskCreateScreen> createState() => _taskCreateScreenState();
}

class _taskCreateScreenState extends State<taskCreateScreen> {

  Map<String,String> FormValues={"title":"", "description":"","status":"New"};
  bool Loading=false;

  InputOnChange(MapKey, Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
    if(FormValues['title']!.length==0){
      ErrorToast('Title Required !');
    }
    else if(FormValues['description']!.length==0){
      ErrorToast('Description Required !');
    }
    else{
      setState(() {Loading=true;});
      bool res=await TaskCreateRequest(FormValues);
      if(res==true){
        if(mounted){
          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        }

      }
      else{
        setState(() {Loading=false;});
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: colorGreen, title: Text('Create New Task')),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: Loading?(const Center(child: CircularProgressIndicator())):(SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add New Task", style: Head1Text(colorDarkBlue)),
                  const SizedBox(height: 1),
                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("title",Textvalue);
                    },
                    decoration: AppInputDecoration("Subject"),

                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("description",Textvalue);
                    },
                    maxLines: 10,
                    decoration: AppInputDecoration("Description"),
                  ),

                  const SizedBox(height: 20),


                  Container(child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild('Create'),
                    onPressed: (){
                      FormOnSubmit();
                    },
                  ),),
                ],
              ),
            )),
          )
        ],
      ),

    );
  }
}