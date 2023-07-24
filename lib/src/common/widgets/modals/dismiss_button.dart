import 'package:flutter/cupertino.dart';

class DismissButton extends StatelessWidget {
  const DismissButton({
    Key? key,
    this.onPressed,
    this.border,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border ??
            Border.all(
              color: const Color(0xFF050505).withOpacity(.5),
              width: 2,
            ),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(18),
        child: Text(
          'Dismiss',
          style: TextStyle(
            color: const Color(0xFF050505).withOpacity(.5),
            fontSize: 20,
            fontFamily: 'Druk Text Wide Cyr',
          ),
        ),
      ),
    );
  }
}