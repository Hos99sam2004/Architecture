import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  /// بيرجعلى بوليان للاتصال بالانترنت 
}
    class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;
  // constructor
  NetworkInfoImpl(this.dataConnectionChecker);
  @override
  /// بيرجعلى بوليان للاتصال بالانترنت
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}