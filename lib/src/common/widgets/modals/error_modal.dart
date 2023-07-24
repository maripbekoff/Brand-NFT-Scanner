import 'package:flutter/material.dart';
import 'package:nft_brand_scanner/src/common/constans/color_constants.dart';
import 'package:nft_brand_scanner/src/common/widgets/modals/dismiss_button.dart';
import 'package:nft_brand_scanner/src/common/widgets/modals/modal_pop_up_button.dart';

class ErrorModal extends StatefulWidget {
  const ErrorModal({
    Key? key,
    this.message = 'Something went wrong',
    this.onTry,
  }) : super(key: key);

  final String? message;
  final VoidCallback? onTry;

  @override
  State<ErrorModal> createState() => _ErrorModalState();
}

class _ErrorModalState extends State<ErrorModal> {
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
                    color: Color(0xFFFF007A),
                  ),
                  child: Image.asset(
                    'assets/images/error_icon.png',
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Oops!',
                  style: TextStyle(
                    color: const Color(0xFF050505),
                    fontSize: isMobile ? 20 : 30,
                    fontFamily: 'Druk Text Wide Cyr',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text(
              widget.message ?? 'Something went wrong',
              style: TextStyle(
                color: AppColors.black,
                fontSize: isMobile ? 15 : 20,
                fontWeight: FontWeight.w400,
                fontFamily: 'AnonymousPro',
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 36),
            isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ModalPopUpButton(
                        title: 'Try Again',
                        onPressed: () => widget.onTry!(),
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
                        title: 'Try Again',
                        onPressed: () => widget.onTry!(),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
