import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import '../../common/constans/color_constants.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final connector = WalletConnect(
    bridge: 'https://bridge.walletconnect.org',
    clientMeta: const PeerMeta(
      name: 'WalletConnect',
      description: 'WalletConnect Developer App',
      url: 'https://walletconnect.org',
      icons: [
        'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
      ],
    ),
  );
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
                          onPressed: () async {
                            connector.on(
                                'connect', (session) => print(session));
                            connector.on(
                                'session_update', (payload) => print(payload));
                            connector.on(
                                'disconnect', (session) => print(session));
                            if (!connector.connected) {
                              final session = await connector.createSession(
                                chainId: 4160,
                                onDisplayUri: (uri) {
                                  launchUrlString(uri,
                                      mode: LaunchMode.externalApplication);
                                },
                              );
                            }
                            // Navigator.pushNamed(context, *****);
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
