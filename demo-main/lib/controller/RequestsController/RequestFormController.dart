import 'dart:convert';
import 'package:get/get.dart';
import '../../core/class/statusRequest.dart';
import '../../data/datasource/remote/Requests.dart';
import '../../functions/handlingData.dart';
import '../../services/services.dart';

class RequestFormController extends GetxController {
  Requests requests = Requests(Get.find());
  late statusRequest StatusRequest;
  MyServices services = Get.find();
  dynamic ScheduleData = [];
  bool isConnected = false;
  getData() async {
    if (services.sharedPreferences.getBool("scheduleLectureData") != true) {
      var response = await requests.get_Data_LectureCard_GET();
      StatusRequest = handlingData(response);
      if (StatusRequest == statusRequest.success) {
        response.sort((a, b) => double.parse(
                a['crsTime'].toString().substring(7, 9) +
                    '.' +
                    a['crsTime'].toString().substring(10, 12))
            .compareTo(double.parse(b['crsTime'].toString().substring(7, 9) +
                '.' +
                b['crsTime'].toString().substring(10, 12))));
        ScheduleData = await jsonEncode(response);
        services.sharedPreferences.setString("ScheduleData", ScheduleData);
        services.sharedPreferences.setBool("scheduleLectureData", true);
        isConnected = true;
        ScheduleData = await jsonDecode(
            services.sharedPreferences.getString("ScheduleData").toString());
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
    isConnected = false;
    await services.sharedPreferences.setBool("scheduleLectureData", false);
    await Get.find<RequestFormController>().getData();
  }

  @override
  void onInit() async {
    await getData();
    ScheduleData = await jsonDecode(
        services.sharedPreferences.getString("ScheduleData").toString());

    update();
    super.onInit();
  }
}
