import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nft_brand_scanner/src/common/widgets/modals/error_modal.dart';
import 'package:nft_brand_scanner/src/common/widgets/modals/not_supported_modal.dart';
import 'package:nft_brand_scanner/src/router/routing_const.dart';
import 'package:nft_brand_scanner/src/screens/web/web_auth_screen/cubit/web_login_cubit.dart';
import '../../../common/constans/color_constants.dart';

class WebAuthScreen extends StatefulWidget {
  const WebAuthScreen({super.key});

  @override
  State<WebAuthScreen> createState() => _WebAuthScreenState();
}

class _WebAuthScreenState extends State<WebAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const RadialGradient(
                  colors: [
                    Color(0xFFFFD840),
                    Color(0xFFF3ACFF),
                    Color(0xFF8AECFF),
                  ],
                  radius: 6,
                  center: Alignment(1, -3.5),
                ),
              ),
              child: BlocConsumer<WebLoginCubit, WebLoginState>(
                listener: (context, state) {
                  if (state is WebLoginLoaded) {
                    Navigator.pushNamed(context, CreateOrderRoute);
                  } else if (state is WebLoginFailed) {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return ErrorModal(
                            onTry: () {
                              Navigator.pop(context);
                              context.read<WebLoginCubit>().login();
                            },
                            message: state.error,
                          );
                        });
                  } else if (state is WebLoginNotSupported) {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return const NotSupportedModal();
                        });
                  }
                },
                builder: (context, state) {
                  return CupertinoButton(
                    onPressed: state is WebLoginLoading
                        ? null
                        : () async {
                            context.read<WebLoginCubit>().login();
                          },
                    borderRadius: BorderRadius.circular(16),
                    child: const Text(
                      'Войти с Metamask',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                        fontSize: 14,
                        height: 1.2,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
