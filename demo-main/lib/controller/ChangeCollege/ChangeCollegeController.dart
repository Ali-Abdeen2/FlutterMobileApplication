import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RequestsController/RequestsController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/view/screen/HomePage.dart';
import 'package:hebron_university_app/view/screen/Requests.dart';

class ChangeCollegeController extends GetxController
{
  late statusRequest StatusRequest;
  late statusRequest StatusRequestAdd;
  late statusRequest StatusRequestSpecs;
  TextEditingController textFieldController = TextEditingController();
  late String Choose;
  String AddError="";
  String messageError="";
  Map data={
     "Notes": "",
    "NewColgNo": "",
    "NewSpecNo": ""
  };
  Map<String, List<String>> AllowedColleges = {
  'names': [],
  'id': [],
};
 Map<String, List<String>> AllowedSpecs = {
  'names': [],
  'id': [],
};
  Requests CollegeRequest = Requests(Get.find());


  CollegeChange()async
  {
    data['Notes']=textFieldController.text;
    print(data);
    if(data['NewColgNo']=="")
    {
      messageError="يجب اختيار كلية";
      return 0;
    }
    if(data['NewSpecNo']=="")
    {
      messageError="يجب اختيار التخصص";
      return 0;
    }
     if(data['Notes']=="")
    {
      messageError="يجب ان تقوم بكتابة سبب التحويل";
      return 0;
    }
    
    print("_________________________");
     print(data['NewSpecNo']);
    
    
    print(data);
    int index=int.parse((AllowedColleges['names']?.toList().indexOf(data['NewColgNo'])).toString());
    int index2=int.parse((AllowedSpecs['names']?.toList().indexOf(data['NewSpecNo'])).toString());

    print(index);
    String subject="";
    String subject2="";
    subject=data['NewColgNo'];
    subject2=data['NewSpecNo'];
    data['NewColgNo']=AllowedColleges['id']?[index];
    data['NewSpecNo']=AllowedSpecs['id']?[index2];

    print(data);
    StatusRequestAdd=statusRequest.loading;
    update();
    var response = await CollegeRequest.Add_College_change(data);
    print(response);
    data['NewColgNo']=subject;
    data['NewSpecNo']=subject2;
    
    StatusRequestAdd = handlingData(response);
      
        
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
            
          }
          else
          {
              RequestsController requestsController=Get.put(RequestsController());
              await requestsController.getData();
              messageError="";
              Get.off(HomePage());
              Get.to(Requestes(index: 1));
             
          }
        }
        else
        {
          
          messageError="1حدث خطأ";

        }
       
  data={
     "Notes": "",
    "NewColgNo": "",
    "NewSpecNo": ""
  };
   update();
  }

  GetSpecs(id) async
  {
    StatusRequestSpecs=statusRequest.loading;
    update();
    AllowedSpecs = {
          'names': [],
          'id': [],
        };
    print(id);
    StatusRequestSpecs =await statusRequest.loading;
    var response=await CollegeRequest.get_Specs_Get(id+1);
    print(response);
     StatusRequestSpecs = handlingData(response);
    StatusRequestSpecs=handlingData(response);
    if(statusRequest.success==StatusRequestSpecs)
    {
      for(int i=0;i<response['data'].length;i++)
      {
        AllowedSpecs['names']?.add(response['data'][i]['specName']);
        AllowedSpecs['id']?.add(response['data'][i]['specNo']);
      }
    }
    else
    {
      StatusRequestSpecs =await statusRequest.error;
    }
    print("___________________");

    print(AllowedSpecs);

    print("___________________");
    update();
  }

  GetColleges()async
  {
     StatusRequest =await statusRequest.loading;
    update();
    
    var response=await CollegeRequest.get_Colleges_Get();
    print(response);
     StatusRequest = handlingData(response);
    StatusRequest=handlingData(response);
    if(statusRequest.success==StatusRequest)
    {
      for(int i=0;i<response['data'].length;i++)
      {
        AllowedColleges['names']?.add(response['data'][i]['colgName']);
        AllowedColleges['id']?.add(response['data'][i]['colgNo']);
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
    StatusRequestAdd=statusRequest.success;
    StatusRequestSpecs=statusRequest.noContent;
    StatusRequest=statusRequest.noContent;
    await GetColleges();
    super.onInit();
  }
}