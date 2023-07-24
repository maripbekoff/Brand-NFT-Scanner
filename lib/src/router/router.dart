import 'package:flutter/cupertino.dart';
import 'package:nft_brand_scanner/src/router/routing_const.dart';
import 'package:nft_brand_scanner/src/screens/product_scan_screen/product_scan_screen.dart';
import 'package:nft_brand_scanner/src/screens/qr_scanner_screen/qr_scanner_screen.dart';
import 'package:nft_brand_scanner/src/screens/web/create_order_screen/create_order_screen.dart';
import 'package:nft_brand_scanner/src/screens/web/web_auth_screen/web_auth_screen.dart';
import '../screens/auth/auth_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (context) => AuthScreen(),
        );
      case ProductRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (context) => ProductScanScreen(),
        );
      case QRRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (context) => QRScannerScreen(),
        );
      case WebLoginRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (context) => WebAuthScreen(),
        );
      case CreateOrderRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (context) => CreateOrderScreen(),
        );
      default:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (context) => Center(child: Text("Роут не найден")),
        );
    }
  }
}
