import 'package:flutter/material.dart';
import 'package:tasks_menegers/utility/text_style/text_style.dart';



ListView TaskList(TaskItems,DeleteItem,StatusChange){


  return ListView.builder(
      itemCount: TaskItems.length,
      itemBuilder: (context,index){

        Color statusColor=colorGreen;
        if(TaskItems[index]['status']=="New"){
          statusColor=colorBlue;
        }
        else if(TaskItems[index]['status']=="Progress"){
          statusColor=colorOrange;
        }
        else if(TaskItems[index]['status']=="Canceled"){
          statusColor=colorRed;
        }

        return Card(
          child: ItemSizeBox(
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TaskItems[index]['title'],style: Head6Text(colorDarkBlue),),
                  Text(TaskItems[index]['description'],style: Head7Text(colorLightGray),),
                  Text(TaskItems[index]['createdDate'],style: Head9Text(colorDarkBlue),),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatusChild(TaskItems[index]['status'],statusColor),
                      Row(
                        children: [
                          ElevatedButton(onPressed:(){
                            StatusChange(TaskItems[index]['_id']);
                          },child: Icon(Icons.list_alt_outlined,size: 16),),


                          SizedBox(width: 10),

                          Icon(

                       Icons.delete_forever,size: 16,color: Colors.purple,),

                        ],
                      )

                    ],
                  )
                ],
              )
          ),
        );
      }
  );
}