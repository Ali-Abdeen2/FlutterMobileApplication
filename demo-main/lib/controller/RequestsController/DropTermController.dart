import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RequestsController/RequestsController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/services/services.dart';
import 'package:hebron_university_app/view/screen/HomePage.dart';
import 'package:hebron_university_app/view/screen/Requests.dart';

class DropTermController extends GetxController
{
  TextEditingController textFieldController = TextEditingController();
  late statusRequest StatusRequest;
  MyServices services=Get.find();
  Requests requests = Requests(Get.find());
  String message="";
  Dropterm()async
  {
     StatusRequest =await statusRequest.loading;
     update();
    Map data={};
    print(textFieldController.text);
    data["Notes"]= await textFieldController.text;
    var response=await requests.Drop_Term_Post(data);
    print(response);
     StatusRequest = handlingData(response);
    if(statusRequest.success==StatusRequest)
    {
      print(response);
      if(!response['isSuccess'])
      {
        if(response['errorCode']=="ERR_Already_Have_Request")
        {
          message=" لقد قمت بارسال الطلب بالفعل";
        }   
      }
      else
      {
        RequestsController requestsController=Get.put(RequestsController());
        await requestsController.getData();
         message="";
        Get.off(HomePage());
        Get.to(Requestes(index: 1));
      }
      
    }
    else
    {
      if(data['Notes']=="")
      {
        print("يجب كتابة السبب");
        message="يجب كتابة السبب";
      }
      else
      {
      print("something wrong");
      message="حدث خطأ";

      }

    }
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    StatusRequest=statusRequest.noContent;
    super.onInit();
  }
}