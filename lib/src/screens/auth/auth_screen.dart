import 'package:flutter/cupertino.dart';
import '../../common/constans/color_constants.dart';
import '../../router/routing_const.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Image.asset(
                "assets/images/fox.png",
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Мы сервис, который поможет доказать подлинность брендированных вещей.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 18),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Text(
                      'Добро пожаловать!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontSize: 24,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 8, 20, 32),
                      child: Text(
                        'Перед тем как начать, тебе нужно авторизоваться через Metamask.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGrey,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(75, 0, 75, 20),
                    child: SizedBox(
                      width: 224,
                      height: 56,
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
                        child: CupertinoButton(
                          onPressed: () {
                         Navigator.pushNamed(context, ProductRoute);
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
