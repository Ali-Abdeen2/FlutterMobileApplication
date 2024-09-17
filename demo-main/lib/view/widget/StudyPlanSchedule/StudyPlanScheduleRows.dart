import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constatnt/ColorsApp.dart';

class StudyPlanScheduleTitleRow extends StatelessWidget {
  const StudyPlanScheduleTitleRow({super.key, this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
                final textScaleFactor = MediaQuery.of(context).textScaleFactor;

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          width: Get.width,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "ملاحظات",
                      style: TextStyle(
                          color: ColorsApp.StudyPlanScheduleTitleColor,
                          fontSize: textScaleFactor>=2?8:textScaleFactor>1.45?10:12,),
                    )),
              ),
              Expanded(
                flex: 4,
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "الحالة",
                      style: TextStyle(
                          color: ColorsApp.StudyPlanScheduleTitleColor,
                          fontSize: textScaleFactor>=2?8:textScaleFactor>1.45?10:12),
                    )),
              ),
              Expanded(
                flex: 5,
                child: Container(
                    alignment: Alignment.center,
                    child: Text("س. معتمدة",
                        style: TextStyle(
                            color: ColorsApp.StudyPlanScheduleTitleColor,
                           fontSize: textScaleFactor>=2?8:textScaleFactor>1.45?9.5:12),
                        textAlign: TextAlign.center)),
              ),
              Expanded(
                flex: 9,
                child: Container(
                    alignment: Alignment.center,
                    child: Text("اسم\n المساق",
                        style: TextStyle(
                            color: ColorsApp.StudyPlanScheduleTitleColor,
                            fontSize: textScaleFactor>=2?8:textScaleFactor>1.45?10:12),
                        textAlign: TextAlign.center)),
              ),
              Container(
                  width: 6,
                  height: 46,
                  color: Colors.transparent,
                  child: Text(
                    "",
                    style: TextStyle(
                        color: ColorsApp.StudyPlanScheduleTitleColor,
                        fontSize: 12),
                  )),
              Expanded(
                flex: 5,
                child: Container(
                    alignment: Alignment.center,
                    child: Text("رقم المساق",
                        style: TextStyle(
                            color: ColorsApp.StudyPlanScheduleTitleColor,
                            fontSize: textScaleFactor>=2?8:textScaleFactor>1.45?10:12),
                        textAlign: TextAlign.center)),
              ),
            ],
          ),
        );
      },
    );
  }
}

class StudyPlanScheduleRow extends StatelessWidget {
  const StudyPlanScheduleRow(
      {super.key,
      this.crsNo,
      this.crsName,
      this.planCrsCrdHours,
      this.crsStatus,
      this.isPassed});

  final crsNo;
  final crsName;
  final planCrsCrdHours;
  final crsStatus;
  final isPassed;
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final textScaleFactor = MediaQuery.of(context).textScaleFactor;

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: ColorsApp.StudyPlanSchedulColor,
              borderRadius: BorderRadius.circular(10)),
          width: Get.width,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "${isPassed}",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        
                        "${crsStatus}",
                        style: TextStyle(
                          fontSize: textScaleFactor>=2?8:textScaleFactor>1.45?10:12,
                          color: Colors.black),
                      )),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${planCrsCrdHours}",
                        style: TextStyle(
                          fontSize: textScaleFactor>=2?8:textScaleFactor>1.45?10:12,
                          color: Colors.black),
                      )),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "${crsName.toString().trim().split(RegExp(r'\s+')).join(" ")}",
                        style: TextStyle(
                          fontSize: textScaleFactor>=2?8:textScaleFactor>1.45?10:12,
                          color: Colors.black),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      )),
                ),
                Container(
                  color: Colors.grey,
                  child: Text(""),
                  width: 6,
                  height: double.infinity,
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${crsNo}",
                        style: TextStyle(
                          fontSize: textScaleFactor>=2?8:textScaleFactor>1.45?10:12,
                          color: Colors.black, ),
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
