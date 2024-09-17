import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormFieldUserController extends GetxController
{
  late String userName;
  late String password;
  late bool hide=true;
  late TextEditingController TextEditingControllerUser;
  late TextEditingController TextEditingControllerPassword;
 onChangeUser(value)
 {
  userName=value;
  print("the user value ${userName}");
  update();
 }
  
  onChangePassword(value)
 {
  password=value;
  print("the password value ${password}");
  update();
 }

 onChangeHide(value)
 {
  hide=value;
  update();
 }

@override
  // TODO: implement onDelete
  

 @override
  void onInit() {
    // TODO: implement onInit
    TextEditingControllerUser= TextEditingController();
    TextEditingControllerPassword=TextEditingController();
      userName="";
      password="";
      hide=true;
    super.onInit();
  }
}
