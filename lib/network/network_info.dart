// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:internet_connection_checker/internet_connection_checker.dart';



class NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;
  NetworkInfo(
     this._internetConnectionChecker,
  );


  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
