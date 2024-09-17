import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/loginPageController/TextFormFieldUserController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/functions/checkinternet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../../services/services.dart';
class Crud{

  MyServices services=Get.find();
  Future<Either<statusRequest,Map>> postDataLogin(String linkurl,Map data) async
  {
   TextFormFieldUserController TextController=Get.put(TextFormFieldUserController());
     print("the password == =========== ${TextController.password}");
      print("the username == =========== ${TextController.userName}");
     if(await checkinternet())
    {
      
      // var response =await http.post(Uri.parse(linkurl),body: data,headers: {
      //    'Content-Type': 'application/json'
      // });
      // print("object");
//       var headers = {
//   'Content-Type': 'application/json',
//   'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIzMGZjMjA3Ni1mNjhlLTQzNGYtYWQxOC0xNTI4MDQwYzM2Y2UiLCJuYmYiOjE2ODkzMDI0NTYsImV4cCI6MTY4OTMwMzM1NiwiaWF0IjoxNjg5MzAyNDU2LCJpc3MiOiJhYSIsImF1ZCI6ImJiIn0.PSDjbTotjoks8u9J8ydz-SAK_as0v9FUnixukNKS5BY'
// };

// Map data ={
//   "userName": "22011628",
//   "password": "413175100"
// };
print(data);
// Map data={};
// data['userName']=TextController.userName.toString();
// data['password']=TextController.password.toString();
// print("hello $data");

var request =await http.post(Uri.parse('${linkurl}'),
headers: {
'Content-Type': 'application/json',
},
body: jsonEncode(data)
);
// request.body = json.encode({
//   "userName": "22011628",
//   "password": "413175100"
// });
//request.headers.addAll(headers);
print("the status ${request.statusCode}");
var response = await request.body.toString();
      if(request.statusCode==200||request.statusCode==201)
      {
        print("_____________________________________________________________");
        print("1");
        print("the data ${response.toString()}");
        Map<String, dynamic> responseBody = jsonDecode(response.toString());
        await services.sharedPreferences.setString("token","${responseBody['data']['accessToken']}");
        print("2");
        return Right(responseBody);
      }
      else
      {
        
        return Left(statusRequest.error);
      }
    }
    else
    {
      return Left(statusRequest.error);
    }
   
   
  }







Future<Either<statusRequest,Map>> postData(String linkurl,Map data) async
  {
   
     if(await checkinternet())
    {
    print("there is internet");
print(data);

var request =await http.post(Uri.parse('${linkurl}'),
headers: {
'Content-Type': 'application/json',
'Authorization': 'Bearer ${services.sharedPreferences.getString("token")}'
},
body: jsonEncode(data)
);

print("the status ${request.statusCode}");
var response = await request.body.toString();
      if(request.statusCode==200||request.statusCode==201)
      {
       
        print("the data ${response.toString()}");
        Map<String, dynamic> responseBody = jsonDecode(response.toString());
        
        return Right(responseBody);
      }
      else
      {
        
        return Left(statusRequest.error);
      }
    }
    else
    {
      return Left(statusRequest.error);
    }
   
   
  }



















  Future<Either<statusRequest,dynamic>> getData(String linkurl) async
  {
   print("GET ");
     if(await checkinternet())
    {
      print("GET 2");

print('${linkurl}');
var request =await http.get(Uri.parse('${linkurl}'),
headers: {
'Content-Type': 'application/json',
'Authorization': 'Bearer ${services.sharedPreferences.getString("token")}'
},
);

print("the status  of get request ${request.statusCode}");
var response = await request.body.toString();
      if(request.statusCode==200||request.statusCode==201)
      {
        print("_____________________________________________________________");
        print("1");
        print("the data ${response.toString()}");
        dynamic responseBody = jsonDecode(response.toString());
        print("2");
        return Right(responseBody);
      }
      else if(request.statusCode==204)
      {
        return Left(statusRequest.noContent);
      }
      else
      {
        
        return Left(statusRequest.error);
      }
    }
    else
    {
      print("there is no internet connection");
      return Left(statusRequest.error);
    }
   
   
  }


}



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
