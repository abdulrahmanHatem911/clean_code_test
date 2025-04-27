import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future<bool> get isConnectedWifi;
  Future<bool> get isConnectedMobile;
  Future<bool> get isConnectedEthernet;
  Future<bool> get isConnectedBluetooth;
  Future<bool> get isConnectedVPN;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;
  NetworkInfoImpl({required this.internetConnectionChecker});
  @override
  Future<bool> get isConnected async {
    // Check if the device is connected to the internet
    return await internetConnectionChecker.hasConnection;
  }

  @override
  Future<bool> get isConnectedWifi async {
    // Implement your logic to check Wi-Fi connectivity here
    return true; // Placeholder for actual implementation
  }

  @override
  Future<bool> get isConnectedMobile async {
    // Implement your logic to check mobile data connectivity here
    return true; // Placeholder for actual implementation
  }

  @override
  Future<bool> get isConnectedEthernet async {
    // Implement your logic to check Ethernet connectivity here
    return true; // Placeholder for actual implementation
  }

  @override
  Future<bool> get isConnectedBluetooth async {
    // Implement your logic to check Bluetooth connectivity here
    return true; // Placeholder for actual implementation
  }

  @override
  Future<bool> get isConnectedVPN async {
    // Implement your logic to check VPN connectivity here
    return true; // Placeholder for actual implementation
  }
}
