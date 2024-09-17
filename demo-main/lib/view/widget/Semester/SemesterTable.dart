
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/imageAsset.dart';
import 'package:hebron_university_app/services/services.dart';

import '../../../core/constatnt/ColorsApp.dart';

class SemesterTitleRow extends StatelessWidget {
  const SemesterTitleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: ColorsApp.SemesterRowTitleBackgroundColor,
      ),
      width: Get.width,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  "",
                  style: TextStyle(),
                )),
          ),
          Expanded(
            flex: 5,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  "العلامة",
                  style: TextStyle(
                      fontSize: textScaleFactor >= 2
                          ? 9
                          : textScaleFactor > 1.45
                              ? 10
                              : 17,
                      fontWeight: FontWeight.w500),
                )),
          ),
          Expanded(
            flex: 5,
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  "س/المعتمدة",
                  style: TextStyle(
                      fontSize: textScaleFactor >= 2
                          ? 9
                          : textScaleFactor > 1.45
                              ? 10
                              : 17,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
          ),
          Expanded(
            flex: 5,
            child: Container(
                alignment: Alignment.center,
                child: Text("اسم المساق",
                    style: TextStyle(
                        fontSize: textScaleFactor >= 2
                            ? 9
                            : textScaleFactor > 1.45
                                ? 10
                                : 17,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center)),
          ),
          Expanded(
            flex: 5,
            child: Container(
                alignment: Alignment.center,
                child: Text("رقم  المساق",
                    style: TextStyle(
                        fontSize: textScaleFactor >= 2
                            ? 9
                            : textScaleFactor > 1.45
                                ? 10
                                : 17,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center)),
          ),
        ],
      ),
    );
  }
}

class SemesterRow extends StatelessWidget {
  const SemesterRow({
    Key? key,
    required this.index,
    required this.data,
  }) : super(key: key);

  final int index;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    MyServices services = Get.find();
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    print(data);
    
    List<Widget> courseWidgets = [];
    if (data['termCourses'] != null && data['termCourses'].isNotEmpty) {

      for (int i = 0; i < data['termCourses'].length; i++) {
        courseWidgets.add(
          InkWell(
            onTap: () {
              services.sharedPreferences.setString("Course_Url",data['termCourses'][i]['crsNo'].toString());
              Get.toNamed("/courseMark",parameters: {"termName":data['termName'],"Total":data['termCourses'][i]['mark'].toString()});
                      
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(
                    color: ColorsApp.GradeFileTextColor.withOpacity(0.3)),
                color: Colors.white,
              ),
              width: Get.width,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Image.asset("${ImageAsset.downArrow}"),
                        onTap: () {
                          },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        data['termCourses'][i]['mark'].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: textScaleFactor >= 2
                              ? 9
                              : textScaleFactor > 1.45
                                  ? 10
                                  : 15,
                          ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        data['termCourses'][i]['crsCrHours'].toString(),
                        style: TextStyle(
                          fontSize: textScaleFactor >= 2
                              ? 9
                              : textScaleFactor > 1.45
                                  ? 10
                                  : 15,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        data['termCourses'][i]['courseName'].toString().trim().split(RegExp(r'\s+')).join(" "),
                        style: TextStyle(
                          fontSize: textScaleFactor >= 2
                              ? 9
                              : textScaleFactor > 1.45
                                  ? 10
                                  : 15,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        data['termCourses'][i]['crsNo'].toString(),
                        style: TextStyle(
                          fontSize: textScaleFactor >= 2
                              ? 9
                              : textScaleFactor > 1.45
                                  ? 10
                                  : 15,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }

    return Column(
      children: courseWidgets,
    );
  }
}

// class SemesterRow extends StatelessWidget {
//   const SemesterRow({super.key, this.index, this.data});
//   final index;
//   final data;
//   @override
//   Widget build(BuildContext context) {
//     final textScaleFactor = MediaQuery.of(context).textScaleFactor;
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 12),
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       decoration: BoxDecoration(
//         border:
//             Border.all(color: ColorsApp.GradeFileTextColor.withOpacity(0.3)),
//         color: Colors.white,
//       ),
//       width: Get.width,
//       child: Row(
//         // mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Expanded(
//             flex: 1,
//             child: Container(
//               alignment: Alignment.center,
//               child: InkWell(
//                 child: Image.asset("${ImageAsset.downArrow}"),
//                 onTap: () {
//                   Get.toNamed("/courseMark");
//                 },
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 5,
//             child: Container(
//                 alignment: Alignment.center,
//                 child: Text("${data[index]['termName']}",
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 )),
//           ),
//           Expanded(
//             flex: 5,
//             child: Container(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "3",
//                   style: TextStyle(
//                       fontSize: textScaleFactor >= 2
//                           ? 9
//                           : textScaleFactor > 1.45
//                               ? 10
//                               : 17,
//                       fontWeight: FontWeight.w500),
//                   textAlign: TextAlign.center,
//                 )),
//           ),

// class SemesterRow extends StatelessWidget {
//   const SemesterRow({Key? key, required this.index, required this.data})
//       : super(key: key);

//   final int index;
//   final dynamic data;

//   @override
//   Widget build(BuildContext context) {
//     final textScaleFactor = MediaQuery.of(context).textScaleFactor;

//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 12),
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       decoration: BoxDecoration(
//         border:
//             Border.all(color: ColorsApp.GradeFileTextColor.withOpacity(0.3)),
//         color: Colors.white,
//       ),
//       width: Get.width,
//       child: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Container(
//               alignment: Alignment.center,
//               child: InkWell(
//                 child: Image.asset("${ImageAsset.downArrow}"),
//                 onTap: () {
//                   Get.toNamed("/courseMark");
//                 },
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 5,
//             child: Container(
//               alignment: Alignment.center,
//               child: Text(
//                 data['termCourses'].isNotEmpty
//                     ? data['termCourses'][index]['mark'].toString()
//                     : 'N/A',
//                 style: TextStyle(fontWeight: FontWeight.w500),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 5,
//             child: Container(
//               alignment: Alignment.center,
//               child: Text(
//                 data['termCourses'].isNotEmpty
//                     ? data['termCourses'][index]['crsCrHours'].toString()
//                     : 'N/A',
//                 style: TextStyle(
//                   fontSize: textScaleFactor >= 2
//                       ? 9
//                       : textScaleFactor > 1.45
//                           ? 10
//                           : 17,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 5,
//             child: Container(
//               alignment: Alignment.center,
//               child: Text(
//                 data['termCourses'].isNotEmpty
//                     ? data['termCourses'][index]['courseName'].toString()
//                     : 'N/A',
//                 style: TextStyle(
//                   fontSize: textScaleFactor >= 2
//                       ? 9
//                       : textScaleFactor > 1.45
//                           ? 10
//                           : 17,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 5,
//             child: Container(
//               alignment: Alignment.center,
//               child: Text(
//                 data['termCourses'].isNotEmpty
//                     ? data['termCourses'][index]['crsNo'].toString()
//                     : 'N/A',
//                 style: TextStyle(
//                   fontSize: textScaleFactor >= 2
//                       ? 9
//                       : textScaleFactor > 1.45
//                           ? 10
//                           : 17,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SemesterRow extends StatelessWidget {
//   const SemesterRow({Key? key, required this.index, required this.data})
//       : super(key: key);

//   final int index;
//   final dynamic data;

//   @override
//   Widget build(BuildContext context) {
//     final textScaleFactor = MediaQuery.of(context).textScaleFactor;

//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 12),
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       decoration: BoxDecoration(
//         border:
//             Border.all(color: ColorsApp.GradeFileTextColor.withOpacity(0.3)),
//         color: Colors.white,
//       ),
//       width: Get.width,
//       child: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Container(
//               alignment: Alignment.center,
//               child: InkWell(
//                 child: Image.asset("${ImageAsset.downArrow}"),
//                 onTap: () {
//                   Get.toNamed("/courseMark");
//                 },
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 5,
//             child: Container(
//               alignment: Alignment.center,
//               child: Text(
//                 // data != null && data.containsKey('termName')? data['termName'].toString() : 'N/A',
//                 data['termCourses'].isNotEmpty
//                     ? data['termCourses'][index]['mark'].toString()
//                     : 'N/A',
//                 style: TextStyle(fontWeight: FontWeight.w500),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 5,
//             child: Container(
//                 alignment: Alignment.center,
//                 child: Text(
//                   data['termCourses'].isNotEmpty
//                       ? data['termCourses'][index]['crsCrHours'].toString()
//                       : 'N/A',
//                   style: TextStyle(
//                       fontSize: textScaleFactor >= 2
//                           ? 9
//                           : textScaleFactor > 1.45
//                               ? 10
//                               : 17,
//                       fontWeight: FontWeight.w500),
//                   textAlign: TextAlign.center,
//                 )),
//           ),
//           Expanded(
//             flex: 5,
//             child: Container(
//                 alignment: Alignment.center,
//                 child: Text(
//                     data['termCourses'].isNotEmpty
//                         ? data['termCourses'][index]['courseName'].toString()
//                         : 'N/A',
//                     style: TextStyle(
//                         fontSize: textScaleFactor >= 2
//                             ? 9
//                             : textScaleFactor > 1.45
//                                 ? 10
//                                 : 17,
//                         fontWeight: FontWeight.w500),
//                     textAlign: TextAlign.center)),
//           ),
//           Expanded(
//             flex: 5,
//             child: Container(
//                 alignment: Alignment.center,
//                 child: Text(
//                     data['termCourses'].isNotEmpty
//                         ? data['termCourses'][index]['crsNo'].toString()
//                         : 'N/A',
//                     style: TextStyle(
//                         fontSize: textScaleFactor >= 2
//                             ? 9
//                             : textScaleFactor > 1.45
//                                 ? 10
//                                 : 17,
//                         fontWeight: FontWeight.w500),
//                     textAlign: TextAlign.center)),
//           ),
//         ],
//       ),
//     );
//   }
// }
