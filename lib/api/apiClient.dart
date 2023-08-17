import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:tasks_menegers/api/service.dart';
import 'package:tasks_menegers/style/style.dart';



var BaseURL="https://task.teamrabbil.com/api/v1";
var RequestHeader={"Content-Type":"application/json"};





Future<List> TaskListRequest(Status) async {
  var URL=Uri.parse("${BaseURL}/listTaskByStatus/${Status}");
  String? token= await ReadUserData("token");
  var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
  var response= await http.get(URL,headers:RequestHeaderWithToken);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return ResultBody['data'];
  }
  else{
    ErrorToast("Request fail ! try again");
    return [];
  }
}







Future<List> TaskStatusCount() async {

  var URL=Uri.parse("${BaseURL}/taskStatusCount");

  String? token= await ReadUserData("token");

  var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};

  var response= await http.get(URL,headers:RequestHeaderWithToken);

  var ResultCode=response.statusCode;

  var ResultBody=json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Count Data Success");

    return ResultBody['data'];
  }
  else{
    ErrorToast("Request fail ! try again");
    return [];
  }
}












Future<bool> TaskDeleteRequest(id) async {
  var URL=Uri.parse("${BaseURL}/deleteTask/${id}");
  String? token= await ReadUserData("token");
  var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
  var response= await http.get(URL,headers:RequestHeaderWithToken);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}


Future<bool> TaskUpdateRequest(id,status) async {
  var URL=Uri.parse("${BaseURL}/updateTaskStatus/${id}/${status}");
  String? token= await ReadUserData("token");
  var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
  var response= await http.get(URL,headers:RequestHeaderWithToken);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}