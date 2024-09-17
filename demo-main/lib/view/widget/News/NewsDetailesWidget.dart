import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/NewsController/NewsPageController.dart';
import 'package:hebron_university_app/data/datasource/static/static.dart';
import '../../../data/model/NewsModel.dart';

class NewsDetailePage extends StatelessWidget {

  const NewsDetailePage({
    Key? key,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(
      builder: (context, orientation) {
        return GetBuilder<NewsPageController>
        (
          init: NewsPageController(),
          builder: (controller) {
          return controller.response==null?Container(
            height: double.infinity,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ):
          Stack(
          children: [
            Container(
                width: Get.width,
                color: Colors.red,
                height: Get.width > 500 ? Get.height * 0.41 : Get.height * 0.31,
                child: Image.network(
                  "${controller.response['data']['articleImage']}",
                  fit: BoxFit.fill,
                )),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              width: Get.width,
              margin: Get.width > 500
                  ? EdgeInsets.fromLTRB(0, Get.height * 0.39, 0, 0)
                  : EdgeInsets.fromLTRB(0, Get.height * 0.29, 0, 0),
              height: Get.width > 500 ? Get.height * 0.61 : Get.height * 0.71,
              child: ListView(padding: EdgeInsets.only(top: 7), children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "${controller.response['data']['articleTitle']}",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 15),
                  alignment: Alignment.topRight,
                  child: Text(
                    "${DateTime.parse(controller.response['data']['publishDate']).year}-${DateTime.parse(controller.response['data']['publishDate']).month}-${DateTime.parse(controller.response['data']['publishDate']).day}"
                  ,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "${controller.response['data']['content']}",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                )
              ]),
            )
          ],
        );
        },
        );
      },
    ));
  }
}




//  Container(
//             width: Get.width,
//             height: Get.height*0.2,
//              color: Colors.red,
//             child: Image.asset("${newsModel.images}",fit: BoxFit.fill, ),
//           ),
//           Container(
//            height: Get.height*0.8,
//             decoration: BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
//               border: Border(
                
//                 top: BorderSide()
//               )
//             ),
//             margin: EdgeInsets.fromLTRB(0, Get.height*0.17, 0, 0),
//             width: Get.width,
            
//             child: Text("hello 2 aaaaaaa",style: TextStyle(color: Colors.black)),
//           )










// Column(
//         children: [
//           Flexible(
//             child: CustomScrollView(
//               physics: BouncingScrollPhysics(),
//               slivers: <Widget>[
//                 SliverAppBar(
//                   stretch: _stretch,
//                   onStretchTrigger: () async {},
//                   stretchTriggerOffset: 300.0,
//                   backgroundColor: ColorsApp.selectedTabBarColor,
//                   expandedHeight: 220.0,
//                   flexibleSpace: FlexibleSpaceBar(
//                     title: Text(
//                       "${newsModel.title}",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: Get.width > 600 ? 19 : 16,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     background: Image.asset("${newsModel.images}"),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               "${newsModel.News}",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: Get.width > 600 ? 19 : 16,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ],
//       ),