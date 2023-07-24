import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nft_brand_scanner/src/common/constans/web_platform.dart';
import 'package:nft_brand_scanner/src/common/utils/get_os_inside_web.dart';
import 'package:nft_brand_scanner/src/common/widgets/modals/dismiss_button.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'modal_pop_up_button.dart';

class NotSupportedModal extends StatefulWidget {
  const NotSupportedModal({Key? key}) : super(key: key);

  @override
  State<NotSupportedModal> createState() => _NotSupportedModalState();
}

class _NotSupportedModalState extends State<NotSupportedModal> {
  bool isMobile = false;

  @override
  Widget build(BuildContext context) {
    isMobile = MediaQuery.of(context).size.width < 900;

    return Center(
      child: Container(
        padding: EdgeInsets.all(isMobile ? 22 : 50),
        width: isMobile ? 380 : 800,
        height: isMobile ? 351 : 327,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFF500),
                  ),
                  child: Image.asset(
                    'assets/images/fox.png',
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Connect Metamask',
                  style: TextStyle(
                    color: const Color(0xFF050505),
                    fontSize: isMobile ? 20 : 30,
                    fontFamily: 'Druk Text Wide Cyr',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: TextStyle(
                  fontSize: isMobile ? 15 : 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'AnonymousPro',
                ),
                children: const [
                  TextSpan(text: 'You’ll need to '),
                  TextSpan(
                    text: 'install Metamask ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'to continue. Once you have it installed, go ahead and ',
                  ),
                  TextSpan(
                    text: 'refresh the page',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ModalPopUpButton(
                        onPressed: () {
                          if (kIsWeb) {
                            WebPlatform platform = getOSInsideWeb();
                            switch (platform) {
                              case WebPlatform.android:
                                launchUrlString(
                                    'https://play.google.com/store/apps/details?id=io.metamask&hl=ru&gl=US');
                                break;
                              case WebPlatform.ios:
                                launchUrlString(
                                  'https://apps.apple.com/us/app/metamask-blockchain-wallet/id1438144202',
                                );
                                break;
                              case WebPlatform.web:
                                launchUrlString('https://metamask.io/download/');
                                break;
                              default:
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      DismissButton(
                        border: const Border(),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DismissButton(
                        onPressed: () => Navigator.pop(context),
                      ),
                      ModalPopUpButton(
                        onPressed: () {
                          if (kIsWeb) {
                            WebPlatform platform = getOSInsideWeb();
                            switch (platform) {
                              case WebPlatform.android:
                                launchUrlString(
                                    'https://play.google.com/store/apps/details?id=io.metamask&hl=ru&gl=US');
                                break;
                              case WebPlatform.ios:
                                launchUrlString(
                                  'https://apps.apple.com/us/app/metamask-blockchain-wallet/id1438144202',
                                );
                                break;
                              case WebPlatform.web:
                                launchUrlString('https://metamask.io/download/');
                                break;
                              default:
                            }
                          }
                        },
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}