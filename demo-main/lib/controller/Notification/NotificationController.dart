import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/services/services.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationCard.dart';

class NotificationController extends GetxController
{


  late statusRequest StatusRequestRegister;
  late statusRequest StatusRequestGetNoti;
  late statusRequest StatusRequestRead;
  String ErrorMessage="";
  Requests requests = Requests(Get.find());
  int NumberOfMessages=0;
  List<Widget> Messages=[];
  Register(String token)async
  {
     StatusRequestRegister =await statusRequest.loading;
    Map data={};
    data['token']=token;
    var response=await requests.Register_Token(data);
    print(response);
     StatusRequestRegister = handlingData(response);
    StatusRequestRegister=handlingData(response);
    if(statusRequest.success==StatusRequestRegister)
    {
      print(response);
    }
    else
    {
     
    }
    update();
  }
  
  GetNoti() async
  {
    var response = await requests.get_Message_Get();
      StatusRequestGetNoti = handlingData(response);
      Messages=[];
      NumberOfMessages=0;
      if (StatusRequestGetNoti == statusRequest.success) {
       print(response);
        
       for(int i=0;i<response['data'].length;i++)
       {

        if(response['data'][i]['isRead']!=true)
        {
          NumberOfMessages++;
        }
        Messages.add(NotificationCard(
          isRead:response['data'][i]['isRead'],
          date: response['data'][i]['timeSent'],
          id:response['data'][i]['id'],
          notifContent: response['data'][i]['notifContent'],
          title: "العنوان",
          sender: "مركز الحاسوب",
        ));
          // AvilableCourses.add(
          //   TitleLabel(title: response['data'][i]['planMajTypeDesc']),
            
          // );
          // AvilableCourses.add(
          //   CourseTitleSpecific(),
          // );
          // for(int j=0;j<response['data'][i]['courses'].length;j++)
          // {
          //     AvilableCourses.add(
          //       CourseRowspecific(crsNo: response['data'][i]['courses'][j]['crsNo'], courseName: response['data'][i]['courses'][j]['crsName'], crsTime: "",CrsSeq: response['data'][i]['courses'][j]['crsSeq'],crsHours:response['data'][i]['courses'][j]['crsHours'])
          //     );
          // }
       }
       ErrorMessage="";
      } 
      else
      {
        ErrorMessage="حدث خطأ";
      }

    update();
  }
Future<void> loadResources(bool reload) async {
    print("-------------+++++++++++------------");
    await Get.find<NotificationController>().GetNoti();
  }
  ReadNoti(id) async
  {
    Map data={
      "notificationID":id
    };
     var response=await requests.Set_Read(data);
    print(response);
     StatusRequestRead = handlingData(response);
     if(StatusRequestRead==statusRequest.success)
     {
        await GetNoti();
     }
     update();

  }
  DeleteMessage(id) async
  {
    Map data={
      "notificationID":id
    };
     var response=await requests.Delete_Notifaction(data);
    print(response);
     StatusRequestRead = handlingData(response);
     if(statusRequest.success==StatusRequestRead)
     {
      print("The Delete success");
     }
     else
     {
      print("The Delete Did not success");
     }
    await GetNoti();
    update();
  }
  @override
  void onInit() async{
    // TODO: implement onInit
    print("onINit Noti");
    await GetNoti();
    update();
    super.onInit();
  }
}