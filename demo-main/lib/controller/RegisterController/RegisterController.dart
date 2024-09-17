import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/RegisterController/GetAvilableCourses.dart';
import 'package:hebron_university_app/controller/scheduleLectureControllers/scheduleLectureController.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/services/services.dart';
import 'package:hebron_university_app/view/widget/Register/CourseRow.dart';
import 'package:hebron_university_app/view/widget/Register/CourseRowDialog.dart';
import 'package:hebron_university_app/view/widget/Register/CourseRowspecific.dart';
import 'package:hebron_university_app/view/widget/Register/CourseTitleSpecific.dart';
import 'package:hebron_university_app/view/widget/Register/TitleLabel.dart';

class RegisterController extends GetxController {
  Requests testData = Requests(Get.find());
  Requests deleteCourse = Requests(Get.find());
  Requests GetAvilableclasses = Requests(Get.find());
  Requests AddCourses = Requests(Get.find());
  getAvailableCourses availableCourses =Get.put(getAvailableCourses());

  MyServices services = Get.find();
  late statusRequest StatusRequest;
  late statusRequest StatusRequestDelete;
  late statusRequest StatusRequestclasses;
  late statusRequest StatusRequestAdd;
  late statusRequest StatusRequestSave;

  dynamic RegList;
  bool isConnected = false;
  List <Widget> Listreg=[];
  List <Widget> AvilableClasses=[];
  String AddError="تم التسجيل بنجاح";
  String SaveError="تمت عملية الحفظ بنجاح";
  dynamic Hours=0;
    get_data() async {
      Hours=0;
      

      var response = await testData.get_Data_Reg_List_GET();
      StatusRequest = handlingData(response);
      
      if (StatusRequest == statusRequest.success) {
        RegList = await response;
        
       for(int i=0;i<response['data'].length;i++)
       {
        print(RegList["data"][i]['crsNo']);
        print(RegList["data"][i]['courseName']);
        print(RegList["data"][i]['crsTime']);
        print(RegList["data"][i]['crsSeq']);
        Hours+=RegList['data'][i]['crsHours'];
        Listreg.add(
          CourseRow(
            courseName:RegList["data"][i]['courseName']
            ,crsNo:RegList["data"][i]['crsNo']
             ,crsTime: RegList["data"][i]['crsTime'],
             CrsSeq: RegList["data"][i]['crsSeq'],
             classNo: RegList["data"][i]['classNo'],
             )
          
          );
       }
      } 
    

    update();
  }

  Delete_Data(Map data)async
  {

    print(data);
     StatusRequest = statusRequest.loading;
     update();
    var response=await deleteCourse.Delete_Course_Post(data);
    StatusRequestDelete = handlingData(response);
    if(StatusRequestDelete==statusRequest.success)
    {
      print(response);
     
       Listreg=[];
      await get_data();
    }
    else
    {
      print("error");
    }
  }
  
  get_available_classes(Map data)async
  {
    AvilableClasses=[];
    availableCourses.StatusRequest=statusRequest.loading;
    update();
    var response=await GetAvilableclasses.get_available_classes_Post(data);
    
    StatusRequestclasses = handlingData(response);
    if(StatusRequestclasses==statusRequest.success)
    {
      
      print(statusRequest);
      print(response);

      for(int i=0;i<response["data"].length;i++)
      {
        AvilableClasses.add(
          CourseRowDialog(
            crsTime: response["data"][i]['time'],
             courseName: response["data"][i]['crsName'],
              crsNo: response["data"][i]['crsNo'],
               teacherName: response["data"][i]['teacherName'],
                crsSeq: response["data"][i]['crsSeq'],
                classNo: response["data"][i]['classNo'],
                isOpen: response["data"][i]['isOpen'],
                roomNo: response["data"][i]['roomNo'],
               
               )
        );
      }
    }
    else
    {
      print("error");
    } 
    availableCourses.StatusRequest=statusRequest.noContent;

    update();
  }
   AddCourse(Map data)async
  {
    StatusRequestAdd=statusRequest.loading;
    update();
    
    var response = await AddCourses.Add_Courses_Post(data);
      StatusRequestAdd = handlingData(response);
      
      if (StatusRequestAdd == statusRequest.success) {
        print(response);
        await get_data();
        if(response['isSuccess']==false)
        {
            AddError="حدث خطأ ما";
            if(response['errorCode']=="ERR_CourseAlreadyInReg")
            {
              AddError="هذه المساق بالفعل مسجل";
            }
            else if(response['errorCode']=="ERR_ClassIsClosed")
            {
              AddError="الشعبة مغلقة";
            }
            else if(response['errorCode']=="ERR_ClassNotAvailable")
            {
              AddError="الشعبة مغلقة";
            }
            else if(response['errorCode']=="ERR_ClassIsClosed")
            {
              AddError="الشعبة مغلقة";
            }
            else if(response['errorCode']=="ERR_TimeConflict")
            {
              AddError="يوجد تعارض بالوقت";
            }
            else if(response['errorCode']=="ERR_CrsLevelHigherThanStudent")
            {
              AddError="مستوى المساق اعلى من مستوى الطالب";
            }
            else if(response['errorCode']=="ERR_MustTakePrerequisite")
            {
              AddError="يجب اجتياز المتطلب السابق \n ${response['data']['crsNo']} ${response['data']['crsName']}";
            }
        }
        else
        {
             AddError="تم التسجيل بنجاح";
        }
        StatusRequest= statusRequest.loading;
         Listreg=[];
       await get_data();
      } 
      else
      {
         AddError="حدث خطأ ما";
        print("error");
      }
      

    update();
  }
  save()async
  {
    StatusRequestSave=statusRequest.loading;
    update();
   var response= await AddCourses.Save_Reg();
   StatusRequestSave = handlingData(response);
   if(StatusRequestSave==statusRequest.error)
   {
      SaveError="حدث خطأ";
   }
   else if(response['isSuccess']==false)
   {
     SaveError="حدث خطأ ما";
     if(response['errorCode']=="ERR_ExceedMaxHours")
     {
      SaveError="لقد تجاوزت عدد الساعات المسموح بها";
     }
     else if(response['errorCode']=="ERR_NotReachMinHours")
     {
      SaveError="عدد الساعات اقل من المسموح به";
     }
   }
   else
   {
    SaveError="تمت عملية الحفظ بنجاح";
    ScheduleLectureController lectureController=Get.put(ScheduleLectureController());
    await services.sharedPreferences.setBool("studyPlanData",false);
    lectureController.loadResources(true);
   }
   
   update();
  }
  @override
  void onInit() async {
    // TODO: implement onInit
    StatusRequest = statusRequest.loading;
    StatusRequestclasses=statusRequest.loading;
    StatusRequestAdd=statusRequest.noContent;
    StatusRequestSave=statusRequest.noContent;
    await get_data();
    super.onInit();
    update();
  }
}
