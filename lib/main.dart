import 'package:flutter/cupertino.dart';
import 'package:nft_brand_scanner/src/router/router.dart';
import 'package:nft_brand_scanner/src/screens/auth/auth_screen.dart';
import 'package:nft_brand_scanner/src/screens/not_found/not_found_screen.dart';
// import 'package:nft_brand_scanner/src/screens/auth/auth_screen.dart';
// import 'package:nft_brand_scanner/src/screens/qr_scanner_screen/qr_scanner_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      home: NotFoundScreen(),
    );
  }
}
