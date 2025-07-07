import 'package:flutter/material.dart';

class MarkButton extends StatelessWidget {
  const MarkButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.bookmark_rounded,
          color: Colors.white,
        ));
  }
}
