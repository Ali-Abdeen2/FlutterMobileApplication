// import 'package:get/get.dart';

// import '../../core/class/statusRequest.dart';
// import '../../data/datasource/remote/TestRemoteData.dart';
// import '../../functions/handlingData.dart';

// class ProfileController extends GetxController
// {
//   TestData testData =TestData(Get.find());
//   late statusRequest StatusRequest;

//   getData() async
//   {
//     var response=await testData.get_Data_Profile_GET();
//     StatusRequest=handlingData(response);

//     print(response);
//   }
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     print("the scheduleLecture controller init");
//     getData();
//     super.onInit();
//   }
// }

import 'dart:convert';

import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../data/datasource/remote/Requests.dart';
import '../../functions/handlingData.dart';
import '../../services/services.dart';

class ScheduleLectureController extends GetxController {
  Requests requests = Requests(Get.find());
  late statusRequest StatusRequest;
  MyServices services = Get.find();

  //late Map ScheduleData;
  dynamic ScheduleData = [];
  bool isConnected = false;

  getData() async {
    if (services.sharedPreferences.getBool("scheduleLectureData") != true) {
      var response = await requests.get_Data_LectureCard_GET();
      StatusRequest = handlingData(response);
      if (StatusRequest == statusRequest.success) {
        print("+++++++++++++++++++++++++++++++++++++++");

       

        response.sort((a, b) => double.parse(
                a['crsTime'].toString().substring(7, 9) +
                    '.' +
                    a['crsTime'].toString().substring(10, 12))
            .compareTo(double.parse(b['crsTime'].toString().substring(7, 9) +
                '.' +
                b['crsTime'].toString().substring(10, 12))));


        
        // List one=response.where((x)=>
        // x['crsTime'].toString()==""
        // ).toList();
        // List two=response.where((x)=>
        // x['crsTime'].toString().substring(13,20)==" ثلاثاء"
        // ).toList();
        // List three=response.where((x)=>
        // x['crsTime'].toString().contains("")
        // ).toList();
        
       
        //         print("________________");
        // // print(one);
        // // print(two);
        // // print(three);
        // //         print(response[0]['crsTime'].toString().substring(13,20)==" اثنين,");
        // //         print(response[1]['crsTime'].toString().substring(13,20)==" احد,ثل");
        // //         print(response[5]['crsTime'].toString().substring(13,20)==" ثلاثاء");
        // print(response[5]['crsTime'].toString().substring(13,response[5]['crsTime'].toString().length));
        // print(response[4]['crsTime'].toString().substring(13,response[4]['crsTime'].toString().length));
        // print(response[3]['crsTime'].toString().substring(13,response[3]['crsTime'].toString().length));
        // print(response[2]['crsTime'].toString().substring(13,response[2]['crsTime'].toString().length));



        //         print("________________");
        // response=[];
        // response=one+two+three;
        ScheduleData = await jsonEncode(response);
        services.sharedPreferences.setString("ScheduleData", ScheduleData);
        services.sharedPreferences.setBool("scheduleLectureData", true);
        isConnected = true;
        ScheduleData = await jsonDecode(
            services.sharedPreferences.getString("ScheduleData").toString());

        //someObjects.sort((a, b) => a.someProperty.compareTo(b.someProperty));
      } else {
        ScheduleData.add(404);
        StatusRequest = statusRequest.success;
        isConnected = false;
      }

      print(response);
    } else {
      isConnected = true;
    }

    update();
  }

  Future<void> loadResources(bool reload) async {
    print("-------------+++++++++++------------");
    isConnected = false;
    await services.sharedPreferences.setBool("scheduleLectureData", false);
    update();
    await Get.find<ScheduleLectureController>().getData();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    print("the scheduleLecture controller init");

    await getData();
    ScheduleData = await jsonDecode(
        services.sharedPreferences.getString("ScheduleData").toString());

    update();
    super.onInit();
  }
}
