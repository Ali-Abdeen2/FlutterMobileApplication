import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/controller/Notification/NotificationController.dart';
import 'package:hebron_university_app/functions/checkinternet.dart';
import 'package:hebron_university_app/services/services.dart';
import 'package:hebron_university_app/view/screen/NewsDetailes_.dart';
import 'package:hebron_university_app/view/widget/News/NewsSkeletonizer.dart';
import 'package:hebron_university_app/view/widget/Notifications/NotificationButton.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../controller/NewsController/NewsController.dart';
import '../../core/constatnt/ColorsApp.dart';
import '../../core/constatnt/imageAsset.dart';
import '../../data/datasource/static/static.dart';
import '../widget/loginPage/NewsCard.dart';

class News extends StatelessWidget {
  
  final NewsController newsController = Get.put(NewsController());

  MyServices services =Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: ColorsApp.backgroundColor,
        elevation: 0,
        title: Text("الأخبار",
            style: TextStyle(
                color: ColorsApp.titleColor,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
        centerTitle: true,
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
                      icon:NotificationButton()
                      
                      
                       
                    )
        ],
      ),
      body: GetBuilder<NewsController>(
        init: NewsController(),
        builder: (controller) {
        return controller.data==null?Skeletonizer(
        enabled: true,
        child: 
     ListView(
      children: [
         NewsSkeletonizer(),
         NewsSkeletonizer(),
         NewsSkeletonizer()
      ],
     )
      ):GridView.builder(
      itemCount: controller.data['data'].length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: 500,
        maxCrossAxisExtent: 500,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async{
            await services.sharedPreferences.setString("newsId",controller.data['data'][index]['id'].toString());
            print('Tapped on index: $index');
            Get.to(NewsDetaile(        
               ));
          },
          child: NewsCard(
           
            index: controller.data['data'][index]['id'],
                        title: controller.data['data'][index]['articleTitle'],
                        newsText: controller.data['data'][index]['articleShortDesc'],
                        image: controller.data['data'][index]['articleImage'],
          ),
        );
      },
    );
      },),
      backgroundColor: Colors.white,
    );
  }
}




/*
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hebron_university_app/functions/checkinternet.dart';
import 'package:hebron_university_app/services/services.dart';
import 'package:hebron_university_app/view/screen/NewsDetailes_.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../controller/NewsController/NewsController.dart';
import '../../core/constatnt/ColorsApp.dart';
import '../../core/constatnt/imageAsset.dart';
import '../../data/datasource/static/static.dart';
import '../widget/loginPage/NewsCard.dart';

class News extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  MyServices services =Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("الأخبار",
            style: TextStyle(
                color: ColorsApp.titleColor,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset("${ImageAsset.backArrow}"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(ImageAsset.bellIcon),
            color: Colors.red,
          )
        ],
      ),
      body: GetBuilder<NewsController>(
        init: NewsController(),
        builder: (controller) {
        return controller.response==null?Skeletonizer(
        enabled: true,
        child: 
      Column(
        children: [
         Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: const Color(0xFFEDF7E7),
        child:
         Column(
          children: [
           
            Container(
              
              
              padding: EdgeInsets.all(18),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network("https://www.hebron.edu/images/stories/news/2024/02/journal.jpg")
                  ),
            )
            
          ],
        ),
      ),
         )
        ],
      )
      ):GridView.builder(
      itemCount: controller.response['data'].length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: 500,
        maxCrossAxisExtent: 500,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async{
            await services.sharedPreferences.setString("newsId",controller.response['data'][index]['id'].toString());
            print('Tapped on index: $index');
            Get.to(NewsDetaile(        
               ));
          },
          child: NewsCard(
           
            index: controller.response['data'][index]['id'],
                        title: controller.response['data'][index]['articleTitle'],
                        newsText: controller.response['data'][index]['articleShortDesc'],
                        image: controller.response['data'][index]['articleImage'],
          ),
        );
      },
    );
      },),
      backgroundColor: Colors.white,
    );
  }

  Widget buildNewsGridView() {
    return GridView.builder(
      itemCount: 2,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: 500,
        maxCrossAxisExtent: 500,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            print('Tapped on index: $index');
            
          },
          child: NewsCard(
            index: index,
                        title: "aaaaaaaaa",
                        newsText: "aaaaaaaa",
                        image: "${ImageAsset.News1}",
          ),
        );
      },
    );
  }
}
/*
Column(
        children: [
          Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: const Color(0xFFEDF7E7),
        child:
         Column(
          children: [
            Expanded(
              flex: 8,
              child: 
            Container(
              
              width: double.infinity,
              padding: EdgeInsets.all(18),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network("${image}",fit: BoxFit.fill)
                  ),
            )
            ),
           Expanded(
            flex: 3,
            child:  Container(
              child: Text(
                maxLines: 2,
                "aaaaa",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width > 600 ? 19 : 16),
                  textAlign: TextAlign.center),
            ),
            ),
            Expanded(
              flex: 6,
              child: 
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                " ...",
                maxLines: 4,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: Get.width > 600 ? 14 : 12),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ))
          ],
        ),
      ),
    )
        ],
      )
*/



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
// import 'package:hebron_university_app/core/constatnt/imageAsset.dart';
// import 'package:hebron_university_app/data/datasource/static/static.dart';
// import 'package:hebron_university_app/view/widget/loginPage/NewsCard.dart';

// class News extends StatefulWidget {
//   const News({super.key});

//   @override
//   State<News> createState() => _NewsState();
// }

// class _NewsState extends State<News> {
//     bool _enabled = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text("الأخبار",
//             style: TextStyle(
//                 color: ColorsApp.titleColor,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600)),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: Image.asset("${ImageAsset.backArrow}"),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Image.asset(ImageAsset.bellIcon),
//             color: Colors.red,
//           )
//         ],
//       ),
//       body: Container(
//         margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
//         child: GridView.builder(
//           itemCount: NewsList.length,
//           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//             mainAxisExtent: 500,
//             maxCrossAxisExtent: 500,
//           ),
//           itemBuilder: (context, index) {
//             return InkWell(
//               // onTap: () => Get.toNamed("/newsDetailes"),
//               onTap: () {
//                 print('Tapped on index: $index');
//                 Get.toNamed("/newsDetailes", arguments: {'index': index});
//               },
//               child: NewsCard(
//                 index: index,
//               ),
//             );
//           },
//         ),
//       ),
//       backgroundColor: ColorsApp.onBoardingBackgroundColor,
//     );
//   }
// }

*/
/*
Column(
        children: [
          Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: const Color(0xFFEDF7E7),
        child:
         Column(
          children: [
            Expanded(
              flex: 8,
              child: 
            Container(
              
              width: double.infinity,
              padding: EdgeInsets.all(18),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network("${image}",fit: BoxFit.fill)
                  ),
            )
            ),
           Expanded(
            flex: 3,
            child:  Container(
              child: Text(
                maxLines: 2,
                "aaaaa",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width > 600 ? 19 : 16),
                  textAlign: TextAlign.center),
            ),
            ),
            Expanded(
              flex: 6,
              child: 
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                " ...",
                maxLines: 4,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: Get.width > 600 ? 14 : 12),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ))
          ],
        ),
      ),
    )
        ],
      )
*/



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hebron_university_app/core/constatnt/ColorsApp.dart';
// import 'package:hebron_university_app/core/constatnt/imageAsset.dart';
// import 'package:hebron_university_app/data/datasource/static/static.dart';
// import 'package:hebron_university_app/view/widget/loginPage/NewsCard.dart';

// class News extends StatefulWidget {
//   const News({super.key});

//   @override
//   State<News> createState() => _NewsState();
// }

// class _NewsState extends State<News> {
//     bool _enabled = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text("الأخبار",
//             style: TextStyle(
//                 color: ColorsApp.titleColor,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600)),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: Image.asset("${ImageAsset.backArrow}"),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Image.asset(ImageAsset.bellIcon),
//             color: Colors.red,
//           )
//         ],
//       ),
//       body: Container(
//         margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
//         child: GridView.builder(
//           itemCount: NewsList.length,
//           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//             mainAxisExtent: 500,
//             maxCrossAxisExtent: 500,
//           ),
//           itemBuilder: (context, index) {
//             return InkWell(
//               // onTap: () => Get.toNamed("/newsDetailes"),
//               onTap: () {
//                 print('Tapped on index: $index');
//                 Get.toNamed("/newsDetailes", arguments: {'index': index});
//               },
//               child: NewsCard(
//                 index: index,
//               ),
//             );
//           },
//         ),
//       ),
//       backgroundColor: ColorsApp.onBoardingBackgroundColor,
//     );
//   }
// }
