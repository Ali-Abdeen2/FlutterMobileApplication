// //NEW
// import 'package:flutter/material.dart';
// // import 'package:flutter_application_1/sced/1.dart';
// import 'package:get/get.dart';

// import '../../core/constatnt/ColorsApp.dart';
// import '../../core/constatnt/imageAsset.dart';
// import '../widget/HomePage/navigationDestinationForBottomNavBar.dart';
// // import '../ColorsApp.dart';
// // import '../sced/1.dart';
// // import 'changePasswordWidget.dart';

// class changePassword extends StatelessWidget {
//   const changePassword({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100,
//         backgroundColor: ColorsApp.onBoardingBackgroundColor,
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: Image.asset("${ImageAsset.backArrow}"),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.toNamed("/notification");
//             },
//             icon: Image.asset(ImageAsset.bellIcon),
//             color: Colors.red,
//           )
//         ],
//         elevation: 0,
//         // backgroundColor: Colors.transparent,
//         centerTitle: true,
//         title: Text(
//           "الخطة الدراسية",
//           style: TextStyle(
//               color: ColorsApp.titleColor,
//               fontSize: 20,
//               fontWeight: FontWeight.w600),
//         ),
//       ),
//       // appBar: AppBar(
//       //   backgroundColor: ColorsApp.onBoardingBackgroundColor,
//       //   centerTitle: true,
//       //   title: const Text(
//       //     "تغيير كلمة المرور",
//       //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
//       //   ),
//       //   leading: IconButton(
//       //       onPressed: () {
//       //         Get.back();
//       //       },
//       //       icon: const Icon(Icons.arrow_back, color: Colors.black)),
//       //   actions: [
//       //     IconButton(
//       //         onPressed: () {},
//       //         icon: const Icon(Icons.notifications_none, color: Colors.black))
//       //   ],
//       // ),
//       body: Container(
//         height: double.infinity,
//         color: ColorsApp.onBoardingBackgroundColor,
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             textDirection: TextDirection.rtl,
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text("كلمة المرور القديمة",
//                   style: TextStyle(
//                       fontFamily: "Cairo",
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20)),
//               const TextField(
//                 textDirection: TextDirection.rtl,
//                 decoration: InputDecoration(
//                   suffix: Icon(
//                     Icons.preview_outlined,
//                     color: Colors.black,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide: BorderSide(),
//                   ),
//                   hintTextDirection: TextDirection.rtl,
//                   hintText: '  أدخل كلمة المرور القديمة',
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text("كلمة المرور الجديدة:",
//                   style: TextStyle(
//                       fontFamily: 'Cairo',
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20)),
//               const TextField(
//                 textDirection: TextDirection.rtl,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                         Radius.circular(10.0)), // Adjust the radius as needed
//                     borderSide: BorderSide(),
//                   ),
//                   hintTextDirection: TextDirection.rtl,
//                   hintText: '  أدخل كلمة المرور الجديدة',
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text("تـأكيد كلمـــة المـرور",
//                   style: TextStyle(
//                       fontFamily: "Cairo",
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20)),
//               const TextField(
//                 textDirection: TextDirection.rtl,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                         Radius.circular(10.0)), // Adjust the radius as needed
//                     borderSide: BorderSide(),
//                   ),
//                   hintTextDirection: TextDirection.rtl,
//                   hintText: 'تـأكيد كلمـــة المـرور',
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 " عزيزي الطالب : يجب عليك تغيرر كلمة المرور ويجب أن يكون عدد حروفها 6 على الاقل",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontFamily: 'Cairo'),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Center(
//                   child: TextButton(
//                       style: TextButton.styleFrom(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 60, vertical: 10),
//                         backgroundColor: Colors.green,
//                         primary: Colors.white,
//                       ),
//                       onPressed: () {},
//                       child: const Text("إعتمد",
//                           style: TextStyle(
//                               fontFamily: 'Cairo',
//                               fontWeight: FontWeight.bold)))),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: MainNavigation(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/class/statusRequest.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationButton.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../controller/ChangePasswordControllers/ChangePasswordVisibleityOfPassController.dart';
import '../../core/constatnt/ColorsApp.dart';
import '../../core/constatnt/imageAsset.dart';
import '../widget/HomePage/navigationDestinationForBottomNavBar.dart';
 
class changePassword extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
     final ChangePasswordController _passwordController =
      Get.put(ChangePasswordController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: ColorsApp.onBoardingBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset("${ImageAsset.backArrow}"),
        ),
        actions: [
         IconButton(
                    onPressed: () {
                      Get.toNamed("/Notification");
                    },
                    icon:NotificationButton(),
                    color: Colors.red,
                  )
        ],
        elevation: 0,
        centerTitle: true,
        title: Text(
          "تغيير كلمة المرور",
          style: TextStyle(
            color: ColorsApp.titleColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: _passwordController.StatusRequest==statusRequest.loading?
      Center(
        child: CircularProgressIndicator(),
      ):Container(
        height: double.infinity,
        color: ColorsApp.onBoardingBackgroundColor,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _passwordController.globalKey,
            child: Column(
            textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("كلمة المرور القديمة",
                  style: TextStyle(
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
             GetBuilder<ChangePasswordController>(builder: (controller) {
               return  BuildPasswordFormField(
                id: 1,
                // labelText: "كلمة المرور القديمة",

                hintText: "أدخل كلمة المرور القديمة",
                passwordVisible: _passwordController.oldPasswordVisible,
                togglePasswordVisibility:
                    _passwordController.toggleOldPasswordVisibility,
                controller: _passwordController.oldPasswordController,
              );
             },),
              const SizedBox(
                height: 20,
              ),
              const Text("كلمة المرور الجديدة:",
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              GetBuilder<ChangePasswordController>(builder: (controller) {
                return BuildPasswordFormField(
                  id: 2,
                // labelText: "كلمة المرور الجديدة",
                hintText: "أدخل كلمة المرور الجديدة",
                passwordVisible: _passwordController.newPasswordVisible,
                togglePasswordVisibility:
                    _passwordController.toggleNewPasswordVisibility,
                controller: _passwordController.newPasswordController,
              );
              },),
              const SizedBox(
                height: 20,
              ),
              const Text("تـأكيد كلمـــة المـرور",
                  style: TextStyle(
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              GetBuilder<ChangePasswordController>(builder: (controller) {
                return BuildPasswordFormField(
                  id: 3,
                // labelText: "تأكيد كلمة المرور",
                hintText: "تأكيد كلمة المرور",
                passwordVisible: _passwordController.confirmPasswordVisible,
                togglePasswordVisibility:
                    _passwordController.toggleConfirmPasswordVisibility,
                controller: _passwordController.confirmPasswordController,
              );
              },),
              const SizedBox(
                height: 20,
              ),
              const Text(
                " عزيزي الطالب : يجب عليك تغيرر كلمة المرور ويجب أن يكون عدد حروفها 6 على الاقل",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Cairo'),
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<ChangePasswordController>(
                builder: (controller) {
                return Center(
                  child: 
                  controller.StatusRequest==statusRequest.loading?
                  Skeletonizer(child: 
                  TextButton(
                     style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 10),
                        backgroundColor: Colors.green,
                        primary: Colors.white,
                      ),
                    child: Text("إعتمد",
                          style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                    onPressed: () {
                      
                    },
                  )
                  ):
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 10),
                        backgroundColor: Colors.green,
                        primary: Colors.white,
                      ),
                      onPressed: () async{
                       
                        if(_passwordController.globalKey.currentState!.validate())
                        {
                          print("valid");
                          Map data={
                            "oldPassword":_passwordController.oldPasswordController.text,
                            "newPassword":_passwordController.newPasswordController.text
                          };

                          await _passwordController.PostChangePassword(data);
                        }
                        else
                        {
                          print("not valid");
                        }
                      },
                      child:  Text("إعتمد",
                          style: TextStyle(fontWeight: FontWeight.bold)
                          )
                          )
                          );
              },),
                         GetBuilder<ChangePasswordController>(

                          builder: (controller) {
                           return Column(
                            children: [
                              _passwordController.StatusRequest==statusRequest.error? Center(
                            child: Text("كلمة السر غير صحيحة"),
                          ):
                          _passwordController.StatusRequest==statusRequest.success?
                           Center(
                            child: Text("تم تغير كلمة السر"),
                          ):
                          Text("")
                            ],
                           );
                         },)
            ],
          ),
          )
        ),
      )
     
    );
  }
}







class BuildPasswordFormField extends StatelessWidget {
  
  const BuildPasswordFormField({super.key,required this.hintText,required this.passwordVisible,required this.togglePasswordVisibility,required this.controller,required this.id});
     final hintText;
     final passwordVisible;
     final togglePasswordVisibility;
     final controller;
     final id;
  @override
  Widget build(BuildContext context) {
     final ChangePasswordController _passwordController =
      Get.put(ChangePasswordController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   // labelText,
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 20,
        //   ),
        // ),
         TextFormField(
         validator: (value) {
          
            if(value!.isEmpty==true)
            {
              return "الحقل فارغ";
            }
            if(value.length<=6)
            {
               return "يجب ان تكون كلمة السر اطول من 6 احرف";
            }
            if(id==2||id==3)
            {
              if(_passwordController.confirmPasswordController.text!=_passwordController.newPasswordController.text)
          {
            return "كلمة السر مختلفة";
          }
            }
         },
              controller: controller,
              textDirection: TextDirection.rtl,
              obscureText: !passwordVisible.value,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: togglePasswordVisibility,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(),
                ),
                hintTextDirection: TextDirection.rtl,
                hintText: hintText,
              ),
            )
            ,
      ],
    );
  }
}



//   Widget buildPasswordFormField({
//     // required String labelText,
//     required String hintText,
//     required RxBool passwordVisible,
//     required VoidCallback togglePasswordVisibility,
//     required TextEditingController controller,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Text(
//         //   // labelText,
//         //   style: TextStyle(
//         //     fontWeight: FontWeight.bold,
//         //     fontSize: 20,
//         //   ),
//         // ),
//         Obx(() => TextFormField(
//               controller: controller,
//               textDirection: TextDirection.rtl,
//               obscureText: !passwordVisible.value,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     passwordVisible.value
//                         ? Icons.visibility
//                         : Icons.visibility_off,
//                   ),
//                   onPressed: togglePasswordVisibility,
//                 ),
//                 border: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                   borderSide: BorderSide(),
//                 ),
//                 enabledBorder: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                   borderSide: BorderSide(),
//                 ),
//                 hintTextDirection: TextDirection.rtl,
//                 hintText: hintText,
//               ),
//             )
//             ),
//       ],
//     );
//   }
// }



