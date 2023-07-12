import 'package:flutter/cupertino.dart';
import 'package:nft_brand_scanner/src/screens/auth/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: AuthScreen(),
    );
  }
}
