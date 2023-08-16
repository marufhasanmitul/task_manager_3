import 'dart:convert';
import '../../api/apiClient.dart';
import 'package:http/http.dart' as http;

import '../../api/service.dart';
import '../../style/style.dart';


Future<bool> loginRequest(FormValues) async{
  var URL=Uri.parse("${BaseURL}/login");
  var PostBody=json.encode(FormValues);
  var response= await http.post(URL,headers:RequestHeader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    await WriteUserData(ResultBody);
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}