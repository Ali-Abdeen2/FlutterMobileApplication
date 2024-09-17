import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';

import '../../../controller/loginPageController/TextFormFieldUserController.dart';

class TextFormFieldLoginPage extends StatelessWidget {
  const TextFormFieldLoginPage({super.key, this.hint, this.icon, this.type});
  final hint;
  final icon;

  final type;

  //final TextEditingController controllerText;
  @override
  Widget build(BuildContext context) {
    TextFormFieldUserController textFormFieldUserController =
        Get.put(TextFormFieldUserController(), permanent: true);
    return GetBuilder<TextFormFieldUserController>(
      builder: (controller) {
      return TextFormField(
      keyboardType: type=="user"?TextInputType.number:TextInputType.name,
      obscureText:
          type == "password" ? textFormFieldUserController.hide : false,
      controller: type == "user"
          ? textFormFieldUserController.TextEditingControllerUser
          : textFormFieldUserController.TextEditingControllerPassword,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: ColorsApp.TextFieldLoginPageHintColor),
          filled: true, // Enable filled background
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          suffixIconColor: ColorsApp.LoginIconColor,
          suffixIcon: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            
            onPressed: () {
              if (type == "password") {
                print(textFormFieldUserController.hide);
                textFormFieldUserController.onChangeHide(
                    textFormFieldUserController.hide =
                        textFormFieldUserController.hide == true
                            ? false
                            : true);
              }
            },
            icon: type=="user"||(type=="password"&&textFormFieldUserController.hide==true)?icon:Icon(Icons.lock_open),
          ),
          
          hintText: "${hint.toString()}"),
      //   textDirection: TextDirection.rtl,
      onChanged: (value) {
        if (type == "user") {
          textFormFieldUserController.onChangeUser(value);
        } else if (type == "password") {
          textFormFieldUserController.onChangePassword(value);
        }
      },
    );
    },);
  }
}

class TheFullTextFiled extends StatelessWidget {
  const TheFullTextFiled(
      {super.key, this.hint, this.icon, this.type, this.hide});
  final hint;
  final icon;
  final type;
  final hide;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4), // Shadow color
          spreadRadius: 2, // Spread radius
          blurRadius: 30, // Blur radius
          offset: Offset(0, 10), // Offset in x and y direction
        ),
      ]),
      // padding: EdgeInsets.symmetric(horizontal: 30),

      child:
          TextFormFieldLoginPage(hint: "${hint}", icon: icon, type: "${type}"),
    );
  }
}
