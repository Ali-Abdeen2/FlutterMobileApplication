import 'package:flutter/material.dart';
import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';

class CourseMarkCard extends StatelessWidget {
  const CourseMarkCard({super.key,required this.title, required  this.mark, required this.max});
  final title;
  final mark;
  final max;
  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsApp.CourseCardColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                alignment: Alignment.center,
                child: Text("${title}",
                    style: TextStyle(
                      fontSize: textScaleFactor >= 2
                          ? 7
                          : textScaleFactor > 1.45
                              ? 10
                              : 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center)),
            Container(
                alignment: Alignment.center,
                child: Text("${max}",
                    style: TextStyle(
                        fontSize: textScaleFactor >= 2
                            ? 7
                            : textScaleFactor > 1.45
                                ? 10
                                : 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center)),
            Container(
                alignment: Alignment.center,
                child: Text("${mark}",
                    style: TextStyle(
                        fontSize: textScaleFactor >= 2
                            ? 7
                            : textScaleFactor > 1.45
                                ? 10
                                : 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center))
          ],
        ));
  }
}
