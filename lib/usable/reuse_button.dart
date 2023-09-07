import 'package:flutter/material.dart';

class ReuseButton extends StatelessWidget {
  const ReuseButton({super.key, required this.onTap, required this.guess});
  final void Function() onTap;
  final String guess;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40)),
      child: Text(
        guess,
        textAlign: TextAlign.center,
      ),
    );
  }
}
