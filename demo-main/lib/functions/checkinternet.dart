// import 'package:connectivity/connectivity.dart';

// Future<bool> checkinternet() async {
//   try {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.none) {
//       return false;
//     }
//     print("++++++++++++++++++++++++++++++++++++++++");
//     return true;
//   } catch (_) {
//     return false;
//   }
// }


import 'dart:io';

checkinternet() async
{
  try
  {
    var result=await InternetAddress.lookup("google.com");
    if(result.isNotEmpty&&result[0].rawAddress.isNotEmpty)
    {
      return true;
    }
  }
  catch(_)
  {
    return false;
  }
}