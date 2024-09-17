import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class LocalAuth
{
  static final _auth=LocalAuthentication();


  static Future<bool> _canAuthenticate() async=>
  await _auth.canCheckBiometrics || await _auth.isDeviceSupported();






  static Future<bool> authenticate() async
  {
    try
    {
      if(!await _canAuthenticate())
      {
         return false;
      }
     else
     {

      print("can auth");
       return await _auth.authenticate(
        options:const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true
        ),
        localizedReason: "Use Face Id "
      ,authMessages: const [
        // AndroidAuthMessages
        // (
        //   signInTitle:'sign in'
        // ),

        IOSAuthMessages(
            cancelButton: "No thanks"
        )
      ]);
     }

     
    }
    catch(e)
    {
      debugPrint('error $e');
      return false;
    }
  }



}