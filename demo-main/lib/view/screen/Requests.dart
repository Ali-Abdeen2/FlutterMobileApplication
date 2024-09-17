import 'package:flutter/material.dart';
import 'package:hebron_university_app/controller/RequestsController/RequestsController.dart';
import 'package:hebron_university_app/view/screen/submissionRequests.dart';
import '../../core/constatnt/ColorsApp.dart';
import '../widget/Requests/TabRequestes.dart';
import 'IntrestedPages.dart';
import 'RequestesForm.dart';
import 'package:get/get.dart';

class Requestes extends StatelessWidget {
  const Requestes({super.key,required this.index});
  final index;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: index,
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      toolbarHeight: 80,

                      //-------------------------------------------------------
                      bottom: TabBar(
                        splashFactory: NoSplash.splashFactory,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        onTap: (value) {},
                        tabs: const [
                          TabRequestes(
                            title: "مهتم",
                            type: "selected",
                          ),
                          TabRequestes(
                            title: "طلبات مقدمة",
                            type: "unselected",
                          ),
                          TabRequestes(
                            title: "نماذج طلبات",
                            type: "unselected",
                          ),
                        ],
                      ),

                      leading: Builder(
                        builder: (context) {
                          return IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Get.back();
                            },
                          );
                        },
                      ),

                      title: const Text("طلبات",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      elevation: 0,
                    )
                  ];
                },
                body: IntrestedPage()),
            NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      toolbarHeight: 80,
                      bottom: TabBar(
                        splashFactory: NoSplash.splashFactory,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        onTap: (value) {},
                        tabs: const [
                          TabRequestes(
                            title: "مهتم",
                            type: "unselected",
                          ),
                          TabRequestes(
                            title: "طلبات مقدمة",
                            type: "selected",
                          ),
                          TabRequestes(
                            title: "نماذج طلبات",
                            type: "unselected",
                          ),
                        ],
                      ),
                      leading: Builder(
                        builder: (context) {
                          return IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Get.back();
                            },
                          );
                        },
                      ),
                      title: const Text(" طلبات",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      elevation: 0,
                    )
                  ];
                },
                body: submissionRequests()),
            NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      toolbarHeight: 80,
                      bottom: TabBar(
                        splashFactory: NoSplash.splashFactory,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        onTap: (value) {},
                        tabs: const [
                          TabRequestes(
                            title: "مهتم",
                            type: "unselected",
                          ),
                          TabRequestes(
                            title: "طلبات مقدمة",
                            type: "unselected",
                          ),
                          TabRequestes(
                            title: "نماذج طلبات",
                            type: "selected",
                          ),
                        ],
                      ),
                      leading: Builder(
                        builder: (context) {
                          return IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Get.back();
                            },
                          );
                        },
                      ),
                      title: const Text("طلبات ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      centerTitle: true,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      elevation: 0,
                    )
                  ];
                },
                body: RequestesForm()),
          ],
        ),
        backgroundColor: ColorsApp.onBoardingBackgroundColor,
      ),
    );
  }
}
