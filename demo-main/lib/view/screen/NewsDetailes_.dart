import 'package:flutter/material.dart';
import 'package:hebron_university_app/data/datasource/static/static.dart';

import '../../data/model/NewsModel.dart';
import '../widget/News/NewsDetailesWidget.dart';
import 'package:get/get.dart';



class NewsDetaile extends StatelessWidget {
 

  const NewsDetaile({Key? key,
   
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return
    
     Scaffold(
      body: NewsDetailePage(
      ),
    );
  }
}












// class NewsDetaile extends StatelessWidget {
//   const NewsDetaile({super.key, this.index, String? newsText, String? title});
//   final index;
//   // ({Key? key, this.index});
//   // final int? index;

//   @override
//   Widget build(BuildContext context) {
//     bool _stretch = true;
//     final titleText = NewsList[index ?? 0]?.title ?? '';
//     final newsText =
//         NewsList[index ?? 0]?.News ?? ''; // Use ?. and provide a default value

//     return Scaffold(
//       body: Column(
//         children: [
         
//           Flexible(
//             child: CustomScrollView(
//               physics: BouncingScrollPhysics(),
//               slivers: <Widget>[
//                 SliverAppBar(
//                   stretch: _stretch,
//                   onStretchTrigger: () async {},
//                   stretchTriggerOffset: 300.0,
//                   expandedHeight: 200.0,
//                   flexibleSpace: FlexibleSpaceBar(
//                     title: Text(
//                       "$titleText",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: Get.width > 600 ? 19 : 16,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     background: Image.asset("${ImageAsset.News1}"),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               "$newsText",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: Get.width > 600 ? 19 : 16,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



 /*
             GridView.builder(
                    itemCount: NewsList.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 500, mainAxisExtent: 500),
                    itemBuilder: (context, index) {
                      return NewsCard(
                        index: index,
                      );
                    },
                  ),
           */