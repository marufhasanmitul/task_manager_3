import 'dart:convert';

import '../../../api/apiClient.dart';
import '../../../api/service.dart';
import 'package:http/http.dart'as http;

import '../../../style/style.dart';

Future<bool> TaskCreateRequest(FormValues) async {

  var URL=Uri.parse("${BaseURL}/createTask");
  String? token= await ReadUserData("token");
  var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
  var PostBody=json.encode(FormValues);
  var response= await http.post(URL,headers:RequestHeaderWithToken,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);


  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ");
    return false;
  }
}