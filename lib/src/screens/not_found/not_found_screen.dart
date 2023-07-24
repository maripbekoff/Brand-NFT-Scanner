import 'package:flutter/cupertino.dart';
import '../../common/constans/color_constants.dart';
import '../../router/routing_const.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color(0x000000ff),
        border: const Border(),
        leading: CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          child: const Icon(
            CupertinoIcons.back,
            color: AppColors.white,
          ),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
      ),
      backgroundColor: AppColors.scaffoldBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text(
                "Товар не найден",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: AppColors.white,
                ),
              ),
              const Text(
                "К сожалению, данный товар не найден, попробуйте отсканировать ещё раз",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.grey1,
                ),
              ),
              const SizedBox(height: 135),
              SizedBox(
                height: 182,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/scan.png',
                      ),
                    ),
                    const Center(
                      child: Text(
                        "404",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: double.maxFinite,
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
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.pushNamed(context, QRRoute);
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: const Text(
                    'Окей, продолжить!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      fontSize: 14,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
