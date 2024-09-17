import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RequestsController/RequestsController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/services/services.dart';
import 'package:hebron_university_app/view/screen/HomePage.dart';
import 'package:hebron_university_app/view/screen/Requests.dart';

class SemesterPostponementController extends GetxController
{
  TextEditingController textFieldController = TextEditingController();
  late statusRequest StatusRequest;
  MyServices services=Get.find();
  Requests requests = Requests(Get.find());
  String message="";
  SemesterPostponement()async
  {
    
     
    Map data={};
    print(textFieldController.text);
    data["Notes"]= await textFieldController.text;
    data["NewSpecNo"]="T11";
    if(data['Notes']=="")
      {
        print("يجب كتابة السبب");
        message="يجب كتابة السبب";
        update();
        return 0;
      }
      StatusRequest =await statusRequest.loading;
     update();
    var response=await requests.Semester_Postponement_Post(data);
    print(response);
     StatusRequest = handlingData(response);
    StatusRequest=handlingData(response);
    if(statusRequest.success==StatusRequest)
    {
      print(response);
      if(!response['isSuccess'])
      {
        if(response['errorCode']=="ERR_Already_Have_Request")
        {
          message=" لقد قمت بارسال الطلب بالفعل";
        }
        else if(response['errorCode']=="ERR_Already_Have_Request_P")
        {
          message=" لقد قمت بارسال تأجيل فصل";
        }
         else if(response['errorCode']=="ERR_Already_Have_Request_C")
        {
          message=" لقد قمت بارسال  تحويل كلية";
        }
         else if(response['errorCode']=="ERR_Already_Have_Request_S")
        {
          message=" لقد قمت بارسال تحويل تخصص";
        }
        else
        {
          message="حدث خطأ";
        }
        
      }
      else
      {
        RequestsController requestsController=Get.put(RequestsController());
        await requestsController.getData();
        message="";
        update();
        Get.off(HomePage());
        Get.to(Requestes(index: 1));
        
      }
    }
    else
    {
        print("something wrong");
      message="حدث خطأ";
      
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