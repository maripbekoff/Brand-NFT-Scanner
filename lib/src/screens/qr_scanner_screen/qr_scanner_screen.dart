import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../common/constans/color_constants.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isFlashOn = false;

  @override
void dispose() {
controller?.dispose();
super.dispose();
}
  Future<void> _toggleFlash() async {
    if (controller != null) {
      try {
        if (isFlashOn) {
          await controller!.toggleFlash();
          setState(() {
            isFlashOn = false;
          });
        } else {
          await controller!.toggleFlash();
          setState(() {
            isFlashOn = true;
          });
        }
      } catch (e) {
        print('Failed to toggle flash: $e');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Stack(
          children: [
            QRView(
              overlay: QrScannerOverlayShape(
                borderColor: AppColors.white,
                borderRadius: 14,
                borderLength: 26,
                borderWidth: 3,
                cutOutSize: 186,
              ),
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
            const Positioned(
              top: 59,
              left: 0,
              right: 0,
              child: Text(
                "Scan QR code",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              left: (MediaQuery.sizeOf(context).width - 48) / 2,
              bottom: (MediaQuery.sizeOf(context).height * .15),
              child: CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                     onPressed: () {
                            _toggleFlash;
                          },
                child: SvgPicture.asset(
                  'assets/images/flashlight.svg'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      print(scanData);
    });
  }
}