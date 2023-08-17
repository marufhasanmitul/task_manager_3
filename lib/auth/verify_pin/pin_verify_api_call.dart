import 'dart:convert';

import '../../api/apiClient.dart';
import 'package:http/http.dart' as http;

import '../../api/service.dart';
import '../../style/style.dart';

Future<bool> VerifyOTPRequest(Email,OTP) async{
  var URL=Uri.parse("${BaseURL}/RecoverVerifyOTP/${Email}/${OTP}");
  var response= await  http.get(URL,headers:RequestHeader);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    await WriteOTPVerification(OTP);
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}