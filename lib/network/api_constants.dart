import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'network_info.dart';

class ApiConstants {
  static const String baseUrl = 'http://testapi.alifouad91.com/api';
  static const String registerUrl = '/user/register';
  static const String loginUrl = '/login';
  static const String updateUserUrl = '/user/update';

 static getHeader({String? token}) {
   return   {
      'Connection': 'keep-alive',
      'Accept': 'application/json',
      'Authorization': token??'',
    };
  }
   static NetworkInfo networkInfo = NetworkInfo(InternetConnectionChecker());
}
