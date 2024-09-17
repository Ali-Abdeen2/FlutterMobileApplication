import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
import 'package:hebron_university_app/view/screen/StudyPlanSchedule.dart';
import '../../../data/datasource/static/static.dart';

class StudyPlanCard extends StatelessWidget {
  const StudyPlanCard({super.key, this.index, required this.data});
  final index;
  final data;
  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () async {
          await Get.to(StudyPlanSchedule(data: data[index]));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorsApp.OnBoardingPaint,
                    borderRadius: const BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10)),
                  ),
                  child: Text(
                    "${data[index]['planMajTypeName']}",
                    style: TextStyle(
                        color: ColorsApp.studyPlanTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: textScaleFactor>=2?10:textScaleFactor>1.45?12:15),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: ColorsApp.OnBoardingPaint,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                padding: EdgeInsets.all(10),
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child:
                              Image.asset('${studyplanList[index].LinkIcon}'),
                        ),
                        Column(
                          children: [
                            Text(
                              "عدد الساعات ${data[index]['planMajTypeHours']}",
                              style: TextStyle(
                                fontSize: textScaleFactor>=2?10:textScaleFactor>1.45?12:15,
                                  color: ColorsApp.studyPlanTextColor,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "الساعات المقطوعة ${data[index]['planMajTypePassedHours']} ",
                                style: TextStyle(
                                  fontSize: textScaleFactor>=2?10:textScaleFactor>1.45?12:15,
                                    color: ColorsApp.studyPlanTextColor,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.right),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "الساعات المتبقية ${data[index]['planMajTypeRemainHours']}",
                                style: TextStyle(
                                  fontSize: textScaleFactor>=2?10:textScaleFactor>1.45?12:15,
                                    color: ColorsApp.studyPlanTextColor,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.right),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Text(
                            "مشاهدة",
                            style: TextStyle(
                                fontSize: textScaleFactor>=2?10:textScaleFactor>1.45?12:15,
                                fontWeight: FontWeight.w700,
                                color: ColorsApp.studyPlanTextColor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
