import 'package:flutter/cupertino.dart';
import 'package:nft_brand_scanner/src/router/routing_const.dart';
import 'package:nft_brand_scanner/src/screens/product_scan_screen/product_scan_screen.dart';
import 'package:nft_brand_scanner/src/screens/qr_scanner_screen/qr_scanner_screen.dart';
import '../screens/auth/auth_screen.dart';


class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
            );
            case ProductRoute:
        return CupertinoPageRoute(
          builder: (context) => ProductScanScreen(),
        );
        default:
        return CupertinoPageRoute(
          builder: (context) => QRScannerScreen(),
        );
    }
  }
}