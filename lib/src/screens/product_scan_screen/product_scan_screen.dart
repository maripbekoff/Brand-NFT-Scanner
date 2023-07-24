import 'package:flutter/cupertino.dart';
import 'package:nft_brand_scanner/src/router/routing_const.dart';
import '../../common/constans/color_constants.dart';

class ProductScanScreen extends StatefulWidget {
  const ProductScanScreen({super.key});

  @override
  State<ProductScanScreen> createState() => _ProductScanScreenState();
}

class _ProductScanScreenState extends State<ProductScanScreen> {
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
                "Gucci футболка",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: AppColors.white,
                ),
              ),
              const Text(
                "Оригинальная",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.grey1,
                ),
              ),
              const SizedBox(height: 45),
              Center(
                child: Image.asset(
                  'assets/images/gucci.png',
                  width: 165,
                  height: 216,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 45),
              const Text(
                "Описание",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Товар проверен, он является\nподлинным!",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: [
                              Color(0xFF8AECFF),
                              Color(0xFFF3ACFF),
                              Color(0xFFFFD840),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(
                            Rect.fromLTWH(
                                0, 0, MediaQuery.sizeOf(context).width, 0),
                          ),
                      ),
                    ),
                    const Text(
                      'Вы являетесь первым и единственным владельцем данного товара.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkGrey,
                        fontSize: 14,
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
                    'Окей, закрыть!',
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
