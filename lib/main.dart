import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_brand_scanner/src/router/router.dart';
import 'package:nft_brand_scanner/src/screens/auth/auth_screen.dart';
import 'package:nft_brand_scanner/src/screens/web/web_auth_screen/cubit/web_login_cubit.dart';
import 'package:nft_brand_scanner/src/screens/web/web_auth_screen/web_auth_screen.dart';
import 'src/screens/web/create_order_screen/cubit/create_order_cubit.dart';

// owner Aneka
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WebLoginCubit(),
        ),
        BlocProvider(
          create: (context) => CreateOrderCubit(),
        ),
      ],
      child: const CupertinoApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        home: kIsWeb ? WebAuthScreen() : AuthScreen(),
      ),
    );
  }
}
