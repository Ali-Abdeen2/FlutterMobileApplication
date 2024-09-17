import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/handlingData.dart';

/*
class Requests
 {
   List<dynamic> list = List.empty(growable: true);


   addRequests(int i, String type, String Icon, String Date, String State,
      String StateType) {
    final RequestsItem = {
      i: i,
      'type': type,
      'Icon': Icon,
      'Date': Date,
      'State': State,
      'StateType': StateType,
    };

    list.add(RequestsItem);
  }

  List<dynamic> getList() {
    return list;
  }

  void removeItem(int index) {
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
    }
  }

} 
*/


class RequestsController extends GetxController
{
 List<dynamic> list=[];
 dynamic response =null;
 dynamic response2 =null;
Requests requests = Requests(Get.find());
late statusRequest CrsDropListStatus;
late List<statusRequest> StatusRequest=[];
List<dynamic> getList() {
    return list;
  }
addRequests(int i, String type, String Icon, String Date, String State,
      String StateType) {
    Map RequestsItem = {
      i: i,
      'type': type,
      'Icon': Icon,
      'Date': Date,
      'State': State,
      'StateType': StateType,
    };

    list.add(RequestsItem);
    update();
  }
 removeItem(int index) {
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
    }
    update();
  }

  getData()async
  {
    
     response = await requests.get_Requests_Status();
     response2= await requests.get_crs_Drop_Requests_List();
     print(response.length);
     int size=response.length;
     int counter=0;
     StatusRequest.add(handlingData(response[0]));
     StatusRequest.add(handlingData(response[1]));
     StatusRequest.add(handlingData(response[2]));
     StatusRequest.add(handlingData(response[3]));
      
      for(int i=0;i<size;i++)
      {
        if(statusRequest.success==StatusRequest[i])
        {
          counter++;
        }
      }
    if(counter==size)
    {
      response[0]["name"]="تغير كلية";
      response[1]["name"]="تغير تخصص";
      response[2]["name"]="تأجيل فصل";
      response[3]["name"]="إسقاط الفصل";
    for(int i=0;i<response.length;i++)
    {
      print("!!!!!!!!!!!!!!!!!");
      print(response[i]);
      print("!!!!!!!!!!!!!!!!!");
    }
    
    response=response.where((element) => element['data']!=null);
    print(response.length);
    response=response.toList();

    print(response);
   for(int i=0;i<response.length;i++)
    {
      response[i]["data"]["requestDate"]="${DateTime.parse(response[i]["data"]["requestDate"]).year}-${DateTime.parse(response[i]["data"]["requestDate"]).month}-${DateTime.parse(response[i]["data"]["requestDate"]).day}";
    }
    }
    else
    {
      response="error";
    }
    print(response2);
    CrsDropListStatus=handlingData(response2);
    if(CrsDropListStatus==statusRequest.success)
    {
      for(int i=0;i<response2.length;i++)
      {
        response2[i]["requestTimeInserted"]="${DateTime.parse(response2[i]["requestTimeInserted"]).year}-${DateTime.parse(response2[i]["requestTimeInserted"]).month}-${DateTime.parse(response2[i]["requestTimeInserted"]).day}";
      }
    }
    else
    {
      print("حدث خطأ");
    }
    
    //print( DateTime.parse(response[0]["data"]["requestDate"]).year);

    update();
  }


@override
  void onInit() async{
    // TODO: implement onInit
    //scrollController=new ScrollController();
    await getData();
    // scrollController.addListener(() {
    //   print("the Y Axis $scrollController.offset");
    // });
    super.onInit();
  }
} 
