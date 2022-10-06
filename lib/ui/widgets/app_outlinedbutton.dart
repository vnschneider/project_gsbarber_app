import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  final String asset;
  final VoidCallback onTap;

  const AppOutlinedButton(
      {super.key, required this.asset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        side:
            MaterialStateProperty.all(const BorderSide(color: Colors.black12)),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
        ),
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Image.asset(
          asset,
          height: 28,
        ),
      ),
    );
  }
}
