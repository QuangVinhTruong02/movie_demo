import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectivityManager{
  Future<bool> get isConnected => InternetConnectionChecker().hasConnection;
}