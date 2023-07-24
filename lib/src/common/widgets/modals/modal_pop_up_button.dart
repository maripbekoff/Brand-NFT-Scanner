import 'package:flutter/cupertino.dart';

class ModalPopUpButton extends StatelessWidget {
  const ModalPopUpButton({
    Key? key,
    this.onPressed,
    this.title = 'Install MetaMask',
    this.color = const Color(0xFF050505),
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: color,
      onPressed: onPressed,
      borderRadius: BorderRadius.zero,
      padding: const EdgeInsets.all(18),
      child: Text(
        title,
        style: const TextStyle(
          color: CupertinoColors.white,
          fontSize: 20,
          fontFamily: 'Druk Text Wide Cyr',
        ),
      ),
    );
  }
}