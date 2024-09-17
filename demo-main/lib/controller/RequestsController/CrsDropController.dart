import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RequestsController/RequestsController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/view/screen/HomePage.dart';
import 'package:hebron_university_app/view/screen/Requests.dart';

import '../../data/datasource/remote/Requests.dart';

class CrsDropController extends GetxController
{
  TextEditingController textFieldController = TextEditingController();
  late statusRequest StatusRequest;
  late statusRequest dropStatusRequest;
  Requests requests = Requests(Get.find());
  RequestsController requestsController =Get.put(RequestsController());

  var response ;
  var dropResponse ;
  String dropMessage="";
  GetSubjects()async
  {
    StatusRequest=statusRequest.loading;
     response =await requests.get_Crs_Drop_List();
     print(response);
    StatusRequest=handlingData(response);
    print("__________1");
    print(StatusRequest);
    print("__________1");
  
    if(StatusRequest==statusRequest.success)
    {
      print(StatusRequest);
      print(response);

    }
    
    update();
  }
  Drop(data) async
  {
    print("1");
    data['notes']=textFieldController.text;
    print(data);
    if(data['notes']=="")
    {
      print("object");
      dropMessage="يجب كتابة السبب";
      update();
      return;
    }
    else
    {
      dropMessage="";
    }

    if(dropMessage!="يجب كتابة السبب")
    {
      dropMessage="";
    print(data);
    dropStatusRequest=statusRequest.loading;
    update();
    dropResponse =await requests.Post_Drop_Crs(data);
    print(dropResponse);
    dropStatusRequest=handlingData(dropResponse);
    if(dropStatusRequest==statusRequest.success)
    {
      print("Success");
      textFieldController.text="";
      await requestsController.getData();
      Get.off(HomePage());
      Get.to(Requestes(index: 1));
    }
    else
    {
      
    }
    }
    
    update();
  }
  Future<void> loadResources(bool reload) async {
    print("-------------+++++++++++------------");

    StatusRequest=statusRequest.loading;
    update();
    await Get.find<CrsDropController>().GetSubjects();
    update();
  }
  @override
  void onInit() async{
    // TODO: implement onInit
    dropStatusRequest=statusRequest.noContent;
    await GetSubjects();

    super.onInit();
  }
}