import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/MarksControllers/MarksTermController.dart';
import 'package:hebron_university_app/services/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../LinkApi.dart';
import '../../../core/constatnt/ColorsApp.dart';
import '../../../core/constatnt/imageAsset.dart';

class GradeFileCard extends StatelessWidget {
  const GradeFileCard({super.key, this.index, required this.data});

  final index;
  final data;
  
  @override
  Widget build(BuildContext context) {
            MyServices services = Get.find();

    return OrientationBuilder(
      builder: (context, orientation) {
        final textScaleFactor = MediaQuery.of(context).textScaleFactor;

        return InkWell(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsApp.StudyPlanSchedulColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ]),
            width: Get.width,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text("${data[index]['termName']}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: textScaleFactor > 1.45
                              ? 12
                              : textScaleFactor >= 20
                                  ? 14
                                  : 24)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Image.asset("${ImageAsset.downArrow}"),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  // " ${data[index]['termAvg']} المعدل الفصلي",
                                  "المعدل الفصلي",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: textScaleFactor > 1.45
                                          ? 8
                                          : textScaleFactor >= 20
                                              ? 9
                                              : 14),
                                ),
                              ),
                              Container(
                                child: CircularPercentIndicator(
                                  lineWidth: 6,
                                  percent: data[index]['termAvg'] / 100,
                                  backgroundColor: ColorsApp
                                      .un_selected_circular_percent_indicator,
                                  progressColor: data[index]['termAvg'] >= 60
                                      ? ColorsApp.circular_percent_indicator
                                      : Colors.red,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  center: Text(
                                    "${data[index]['termAvg']}%",
                                    style: TextStyle(
                                        fontSize: textScaleFactor > 1.45
                                            ? 8
                                            : textScaleFactor >= 20
                                                ? 9
                                                : 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  radius: 35,
                                  animation: true,
                                  animationDuration: 1000,
                                ),
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "${data[index]['termAvgCum']}",
                                  style: TextStyle(
                                      fontSize: textScaleFactor > 1.45
                                          ? 8
                                          : textScaleFactor >= 20
                                              ? 9
                                              : 14,
                                      color: ColorsApp.GradeFileTextColor),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "${data[index]['termHours']}",
                                  style: TextStyle(
                                      fontSize: textScaleFactor > 1.45
                                          ? 8
                                          : textScaleFactor >= 20
                                              ? 9
                                              : 14,
                                      color: ColorsApp.GradeFileTextColor),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "${data[index]['hoursFailed']}",
                                  style: TextStyle(
                                      fontSize: textScaleFactor > 1.45
                                          ? 8
                                          : textScaleFactor >= 20
                                              ? 9
                                              : 14,
                                      color: ColorsApp.GradeFileTextColor),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "${data[index]['hoursDropped']}",
                                  style: TextStyle(
                                      fontSize: textScaleFactor > 1.45
                                          ? 8
                                          : textScaleFactor >= 20
                                              ? 9
                                              : 14,
                                      color: ColorsApp.GradeFileTextColor),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "${data[index]['hoursEarned']}",
                                  style: TextStyle(
                                      fontSize: textScaleFactor > 1.45
                                          ? 8
                                          : textScaleFactor >= 20
                                              ? 9
                                              : 14,
                                      color: ColorsApp.GradeFileTextColor),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "المعدل التراكمي",
                                  style: TextStyle(
                                      fontSize: textScaleFactor > 1.45
                                          ? 8
                                          : textScaleFactor >= 20
                                              ? 9
                                              : 14,
                                      color: ColorsApp.GradeFileTextColor),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "س. مسجل",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: textScaleFactor > 1.45
                                          ? 8
                                          : textScaleFactor >= 20
                                              ? 9
                                              : 14,
                                      color: ColorsApp.GradeFileTextColor),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "س. راسب",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: textScaleFactor > 1.45
                                          ? 8
                                          : textScaleFactor >= 20
                                              ? 9
                                              : 14,
                                      color: ColorsApp.GradeFileTextColor),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "س. منسحب",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: textScaleFactor > 1.45
                                          ? 8
                                          : textScaleFactor >= 20
                                              ? 9
                                              : 14,
                                      color: ColorsApp.GradeFileTextColor),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "س. مجتاز",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: textScaleFactor > 1.45
                                          ? 8
                                          : textScaleFactor >= 20
                                              ? 9
                                              : 14,
                                      color: ColorsApp.GradeFileTextColor),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
          onTap: () async{
            // AppLink.marksTerm += "${data[index]['termYYT']}";
            await services.sharedPreferences.setString("Mark_Url",data[index]['termYYT'].toString());
            Get.toNamed("/semester");
          },
          
        );
      },
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// import '../../../core/constatnt/ColorsApp.dart';
// import '../../../core/constatnt/imageAsset.dart';

// class GradeFileCard extends StatelessWidget {
//   const GradeFileCard({super.key,this.Grade});

//   final Grade;
//   @override
//   Widget build(BuildContext context) {
//     return 
//     OrientationBuilder(builder: (context, orientation) {
//       final textScaleFactor = MediaQuery.of(context).textScaleFactor;

//       return 
      
//       InkWell(
//         child: Container(

//                 margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
//                 padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: ColorsApp.StudyPlanSchedulColor,
//                   boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey,
//                     offset: Offset(0.0, 1.0), //(x,y)
//                     blurRadius: 6.0,
//                   ),
//                 ]
//                 ),
                
//                 width: Get.width,
//                 child: Column(
//                   children: [
//                     Container(
//                       alignment: Alignment.center,
//                       child: Text("الفصل الأول 2021/2020",style: TextStyle(fontWeight: FontWeight.w600,fontSize: textScaleFactor>1.45?12:textScaleFactor>=20?14:24)),
//                     ),
//                       Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           flex: 2,
//                           child: Container(
//                             alignment: Alignment.topLeft,
//                             child:Image.asset("${ImageAsset.downArrow}"),

//                           )
                          
//                           ),
//                         Expanded(
//                           flex: 3,
//                           child: Container(
//                             alignment: Alignment.center,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   alignment: Alignment.bottomCenter,
                                  
                                  
//                                   child: Text("المعدل الفصلي",textAlign: TextAlign.center,style: TextStyle(
//                                     fontSize: textScaleFactor>1.45?8:textScaleFactor>=20?9:14
//                                   ),),
//                                 ),
//                                 Container(
                                  
//                                   child: CircularPercentIndicator(
//                                     lineWidth: 6,
//                                     percent: Grade/100,
//                                     backgroundColor: ColorsApp.un_selected_circular_percent_indicator,
//                                     progressColor: Grade>=60?ColorsApp.circular_percent_indicator:Colors.red,
//                                     circularStrokeCap: CircularStrokeCap.round,
//                                   center: Text("${Grade}%",style: TextStyle(fontSize: textScaleFactor>1.45?8:textScaleFactor>=20?9:14,fontWeight: FontWeight.w700),),
//                                     radius:35,
//                                     animation: true,
//                                     animationDuration: 1000,
//                                 ),
//                                 )
//                               ],
//                             ),
//                           )
                          
//                           ),
//                         Expanded(
//                           flex: 1,
//                           child: Container(
                            
//                             child: Column(
//                               children: [
//                                 Container(
//                                   alignment: Alignment.topRight,
//                                   child: Text("0",style: TextStyle(fontSize: textScaleFactor>1.45?8:textScaleFactor>=20?9:14,color: ColorsApp.GradeFileTextColor),textAlign: TextAlign.right,),
                                
//                                 ),
//                                 Container(
//                                   alignment: Alignment.topRight,
//                                   child: Text("0",style: TextStyle(fontSize: textScaleFactor>1.45?8:textScaleFactor>=20?9:14,color: ColorsApp.GradeFileTextColor),textAlign: TextAlign.right,),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.topRight,
//                                   child: Text("0",style: TextStyle(fontSize: textScaleFactor>1.45?8:textScaleFactor>=20?9:14,color: ColorsApp.GradeFileTextColor),textAlign: TextAlign.right,),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.topRight,
//                                   child: Text("0",style: TextStyle(fontSize: textScaleFactor>1.45?8:textScaleFactor>=20?9:14,color: ColorsApp.GradeFileTextColor),textAlign: TextAlign.right,),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.topRight,
//                                   child: Text("0",style: TextStyle(fontSize: textScaleFactor>1.45?8:textScaleFactor>=20?9:14,color: ColorsApp.GradeFileTextColor),textAlign: TextAlign.right,),
//                                 ),
                                
//                               ],
//                             ),
//                           )
                          
//                           ),
//                         Expanded(
//                           flex: 3,
//                           child: Container(
                            
//                             child: Column(
//                               children: [
//                                 Container(
//                                   alignment: Alignment.topRight,
//                                   child: Text("المعدل التراكمي",style: TextStyle(fontSize: textScaleFactor>1.45?8:textScaleFactor>=20?9:14,color: ColorsApp.GradeFileTextColor),textAlign: TextAlign.right,),
                                
//                                 ),
//                                 Container(
//                                   alignment: Alignment.topRight,
//                                   child: Text("س. مسجل",textAlign: TextAlign.right,style: TextStyle(fontSize: textScaleFactor>1.45?8:textScaleFactor>=20?9:14,color: ColorsApp.GradeFileTextColor),),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.topRight,
//                                   child: Text("س. راسب",textAlign: TextAlign.right,style: TextStyle(fontSize: textScaleFactor>1.45?8:textScaleFactor>=20?9:14,color: ColorsApp.GradeFileTextColor),),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.topRight,
//                                   child: Text("س. منسحب",textAlign: TextAlign.right,style: TextStyle(fontSize: textScaleFactor>1.45?8:textScaleFactor>=20?9:14,color: ColorsApp.GradeFileTextColor),),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.topRight,
//                                   child: Text("س. مجتاز",textAlign: TextAlign.right,style: TextStyle(fontSize: textScaleFactor>1.45?8:textScaleFactor>=20?9:14,color: ColorsApp.GradeFileTextColor),),
//                                 ),
                                
//                               ],
//                             ),
//                           )
                          
//                           )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//                 onTap: () {
//                         Get.toNamed("/semester");
//                       },
//                   );
//     },
//     );
    
//   }
// }