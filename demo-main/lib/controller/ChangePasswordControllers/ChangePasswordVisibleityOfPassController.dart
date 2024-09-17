import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/data/datasource/remote/Requests.dart';
import 'package:hebron_university_app/functions/handlingData.dart';
import 'package:hebron_university_app/services/services.dart';
class ChangePasswordController extends GetxController {
  RxBool oldPasswordVisible = false.obs;
  RxBool newPasswordVisible = false.obs;
  RxBool confirmPasswordVisible = false.obs;

  GlobalKey<FormState> globalKey=GlobalKey();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

   Requests requests = Requests(Get.find());
  MyServices services = Get.find();
  late statusRequest StatusRequest;


  PostChangePassword(data)async
  {
    StatusRequest=statusRequest.loading;
    update();
    var response=await requests.Change_Password(data);
    StatusRequest=handlingData(response);
    if(StatusRequest==statusRequest.success)
    {
      print("تم تغير كلمة المرور");
      
      await services.sharedPreferences.setString("password", newPasswordController.text);
      await services.sharedPreferences.setString("AuthPassword", newPasswordController.text);
    }
    else
    {
       print("لم يتم تغير كلمة المرور");
    }
    update();
  }
  void toggleOldPasswordVisibility() {
    oldPasswordVisible.value = !oldPasswordVisible.value;
    update();
  }

  void toggleNewPasswordVisibility() {
    newPasswordVisible.value = !newPasswordVisible.value;
    update();
  }

  void toggleConfirmPasswordVisibility() {
    confirmPasswordVisible.value = !confirmPasswordVisible.value;
    update();
  }
  @override
  void onInit() {
      StatusRequest=statusRequest.noContent;
    super.onInit();
  }
}
