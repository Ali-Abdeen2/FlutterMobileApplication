import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/services/services.dart';
import 'package:hebron_university_app/view/widget/Register/CourseRow.dart';
import 'package:hebron_university_app/view/widget/Register/CourseRowspecific.dart';
import 'package:hebron_university_app/view/widget/Register/CourseTitleSpecific.dart';
import 'package:hebron_university_app/view/widget/Register/TitleLabel.dart';

class getAvailableCourses extends GetxController {
  TextEditingController textFieldController = TextEditingController();
  Requests testData = Requests(Get.find());
  late statusRequest StatusRequestSearch;

  MyServices services = Get.find();
  late statusRequest StatusRequest;
  dynamic courses;
  bool isConnected = false;
  List <Widget> AvilableCourses=[];
  List <Widget> FreeCourses=[];
  String SearchError="";

  Search_Free_Courses(String Search) async
  {
    FreeCourses=[];
    StatusRequestSearch=statusRequest.loading;
    update();
    var response = await testData.get_Free_Courses_(Search);
    StatusRequestSearch=handlingData(response);
    if(statusRequest.success==StatusRequestSearch)
    {
      if(response['isSuccess']==true)
      {
        if(response['data']['courses'].length!=0)
        {
           SearchError="";
           FreeCourses.add(
            TitleLabel(title: response['data']['planMajTypeDesc']),
            
          );
          FreeCourses.add(
            CourseTitleSpecific(),
          );

          for(int i=0;i<response['data']['courses'].length;i++)
          {
            FreeCourses.add(
                CourseRowspecific(crsNo: response['data']['courses'][i]['crsNo'], courseName: response['data']['courses'][i]['crsName'], crsTime: "",CrsSeq: response['data']['courses'][i]['crsSeq'],crsHours:response['data']['courses'][i]['crsHours'])
              );
          }
        }
        else
        {
          SearchError="لم يتم ايجاد اي مساق";
        }
      }
    }
    else
    {
      if(textFieldController.text=="")
      {
        SearchError="يجب كتابة اسم او رقم المساق";
      }
      else
      {
        SearchError="حدث خطأ";
      }
    }

    print(response);
    update();
  }

  get_available_courses()async
  {
    StatusRequest = statusRequest.loading;
    update();
    var response = await testData.get_available_courses_GET();
      StatusRequest = handlingData(response);
      
      if (StatusRequest == statusRequest.success) {
        courses = await response;
        
       for(int i=0;i<response['data'].length;i++)
       {
          AvilableCourses.add(
            TitleLabel(title: response['data'][i]['planMajTypeDesc']),
            
          );
          AvilableCourses.add(
            CourseTitleSpecific(),
          );
          for(int j=0;j<response['data'][i]['courses'].length;j++)
          {
              AvilableCourses.add(
                CourseRowspecific(crsNo: response['data'][i]['courses'][j]['crsNo'], courseName: response['data'][i]['courses'][j]['crsName'], crsTime: "",CrsSeq: response['data'][i]['courses'][j]['crsSeq'],crsHours:response['data'][i]['courses'][j]['crsHours'])
              );
          }
       }
      } 
    

    update();
  }

 
  @override
  void onInit() async {
    // TODO: implement onInit
    StatusRequest = statusRequest.loading;
    StatusRequestSearch=statusRequest.success;
    await get_available_courses();
    super.onInit();
    update();
  }
}
