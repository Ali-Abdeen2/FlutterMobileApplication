import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constatnt/ColorsApp.dart';

class TabsLogin extends StatelessWidget {
  const TabsLogin({super.key,this.type,this.title});

  final type;
  final title;
  @override
  Widget build(BuildContext context) {
    return Container(
                      width: Get.width*0.5,
                      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 4),
                                  decoration: BoxDecoration(
                      color:type=="selected"?ColorsApp.selectedTabBarColor:ColorsApp.unselectedTabBarcolor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                      child: Text("${title}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                      );

                   
  }
}

 