import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RequestsController/RequestsController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/view/screen/HomePage.dart';
import 'package:hebron_university_app/view/screen/Requests.dart';

class ChangeMajorController extends GetxController
{
  late statusRequest StatusRequest;
  late statusRequest StatusRequestAdd;
  TextEditingController textFieldController = TextEditingController();
  late String Choose;

  Map data={
    
  };
  Map<String, List<String>> AllowedSpecs = {
  'names': [],
  'id': [],
};
String messageError="";
  Requests SpecsRequest = Requests(Get.find());

  SpecChange()async
  {
    if(textFieldController.text=="")
    {
      messageError="يجب ان تقوم بكتابة سبب التحويل";
      return 0;
    }
    if(data['NewSpecNo']==null)
    {
      messageError="يجب اختيار تخصص";
      return 0;
    }
    textFieldController.text="";
    print(data);
    int index=int.parse((AllowedSpecs['names']?.toList().indexOf(data['NewSpecNo'])).toString());
    print(index);
    String subject="";
    print(AllowedSpecs['id']?[index]);
    subject=data['NewSpecNo'];
    data['NewSpecNo']=AllowedSpecs['id']?[index].toString();
    print(data);
    StatusRequestAdd=statusRequest.loading;
    update();
    
    print(data);
    print("1");
    var response = await SpecsRequest.Add_Spec_change(data);
    print("2");
    print(response);
    data['NewSpecNo']=subject;
    StatusRequestAdd = handlingData(response);
      
      print("1111");
        if(StatusRequestAdd == statusRequest.success)
        {
          print(response);
          if(response['isSuccess']==false)
          {
            messageError="حدث خطأ";
            if(response['errorCode']=="ERR_Already_Have_Request")
            {
            messageError=" لقد قمت بالفعل بتقديم الطلب";
            }
            if(response['errorCode']=="ERR_SpecIsSame")
            {
            messageError=" نفس التخصص";
            }
          }
          else
          {
            messageError="";
            RequestsController requestsController=Get.put(RequestsController());
            await requestsController.getData();
            Get.off(HomePage());
            Get.to(Requestes(index: 1));
          }
        }
        else
        {
          
          messageError="حدث خطأ";

        }
       data={

       };
  
   update();
  }
  ChangeTheRadio(value)
  {
    print(value);
    Choose=value;
    update();
  }

  GetSpecs()async
  {
     StatusRequest =await statusRequest.loading;
    update();
    var response=await SpecsRequest.get_Specs_Get("T");
    print(response);
     StatusRequest = handlingData(response);
    StatusRequest=handlingData(response);
    if(statusRequest.success==StatusRequest)
    {
      for(int i=0;i<response['data'].length;i++)
      {
        AllowedSpecs['names']?.add(response['data'][i]['specName']);
        AllowedSpecs['id']?.add(response['data'][i]['specNo']);
      }
    }
    else
    {
      StatusRequest =await statusRequest.error;
    }
    update();
  }
  @override
  void onInit() async{
    // TODO: implement onInit
    Choose="";
    StatusRequest=statusRequest.loading;
    StatusRequestAdd=statusRequest.noContent;
    await GetSpecs();
    super.onInit();
  }

}